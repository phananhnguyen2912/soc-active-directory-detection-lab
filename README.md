# Active Directory SOC Detection Lab

A personal SOC home lab for investigating Windows authentication activity in Active Directory. Windows Security events from a domain controller are forwarded to Splunk Enterprise and analyzed with SPL.

## Lab Environment

| System | Lab IP | Role |
|---|---|---|
| Host machine | `192.168.56.1` | Splunk Enterprise |
| DC01 | `192.168.56.10` | Windows Server, Active Directory Domain Services, DNS, and Splunk Universal Forwarder |
| CLIENT01 | `192.168.56.20` | Domain-joined Windows 11 workstation |

The `soclab.test` domain runs in Oracle VirtualBox on a host-only network. Splunk Universal Forwarder sends the Windows Security log from DC01 to Splunk Enterprise on the host.

## Detection Scenarios

| Scenario | Validation | Documentation |
|---|---|---|
| Single failed network logon | Event `4625` located in Splunk | [Investigation](scenarios/01-failed-logon.md) · [SPL](detections/failed-logon.spl) |
| Password spraying | 10 failed logons across 10 accounts from one source IP | [Investigation](scenarios/02-password-spraying.md) · [SPL](detections/password-spraying.spl) |
| Repeated logon failures and account lockout | Account lockout and successful post-unlock network logon verified in Splunk | [Investigation](scenarios/03-brute-force-account-lockout.md) |

## Findings

- **Single failed network logon.** Event `4625` on DC01 recorded a network logon failure (Logon Type `3`) for `labuser02`. SubStatus `0xC000006A` identified an incorrect password. The corresponding event was located in Splunk.
- **Password spraying.** The test sequence produced 10 failed logons across 10 distinct accounts from `192.168.56.20`. The wider search shown in the evidence returned 12 failures because it included two earlier tests. The SPL query groups incorrect-password failures by source IP and flags sources associated with at least five distinct accounts within the selected search range.
- **Account lockout and recovery.** Active Directory showed `labuser10` locked when its bad-password count reached five. Splunk captured the lockout (`4740`), the unlock (`4767`), and a later successful network logon (`4624`).

## Evidence and Limitations

See the [evidence index](evidence/README.md) for screenshots and descriptions. Current collection covers the Windows Security log on DC01. Windows authentication events do not expose the passwords entered. Validation used manual Splunk searches. Event totals depend on the search time range and may differ from the number of client commands.

## Skills Practiced

Active Directory administration, Windows security auditing, Splunk log forwarding, SPL, authentication event correlation, and technical documentation.

## Scope

All lab activity uses virtual machines and test accounts under my control.
