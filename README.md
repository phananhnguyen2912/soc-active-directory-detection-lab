# Active Directory SOC Detection Lab

A personal SOC home lab focused on Windows authentication, centralized log collection, attack simulation, and detection testing with Splunk.

## Objectives

- Understand authentication and security auditing in Active Directory.
- Collect Windows Security logs using Splunk Universal Forwarder.
- Simulate suspicious authentication activity in a controlled environment.
- Develop and test detection queries using SPL.
- Investigate events and document findings with supporting evidence.

## Lab Environment

| System | Lab IP Address | Role |
|---|---|---|
| Host machine | 192.168.56.1 | Splunk Enterprise |
| DC01 (Windows Server) | 192.168.56.10 | Active Directory Domain Services, DNS, and Universal Forwarder |
| CLIENT01 (Windows 11) | 192.168.56.20 | Domain-joined Windows 11 workstation |

- **Domain:** soclab.test
- **Virtualization:** Oracle VirtualBox
- **Lab network:** Host-only
- **Current log source:** Windows Security log on DC01

## Data Flow

Activity generated on CLIENT01 is recorded in the Security log on DC01.
Splunk Universal Forwarder sends these events to Splunk Enterprise
on the host machine for searching and analysis.

## Project Status

| Component or Scenario | Status |
|---|---|
| Active Directory deployment and workstation domain join | Completed |
| Windows Security log forwarding to Splunk | Verified |
| Single failed authentication attempt | Verified |
| Password spraying simulation and detection validation | In progress |
| Brute-force simulation and detection | Planned |
| Successful authentication following repeated failures | Planned |

## Documentation

- [Failed Authentication Investigation](scenarios/01-failed-logon.md)
- [Failed Logon Investigation Query](detections/failed-logon.spl)

## Verified Findings

A failed attempt to access the IPC$ share on DC01 from CLIENT01
using SOCLAB\labuser02 generated a Windows Security event with
the following details:

| Field | Observed Value |
|---|---|
| Event ID | 4625 |
| Target account | labuser02 |
| Workstation | CLIENT01 |
| Logon Type | 3 — Network |
| Status | 0xC000006D |
| SubStatus | 0xC000006A — Incorrect password |

The event was observed on DC01 and located in Splunk, confirming
the collection and forwarding of this authentication failure.

## Skills Practiced

- Active Directory administration
- Windows authentication and auditing
- PowerShell
- Splunk configuration and SPL
- Log analysis and troubleshooting
- Detection testing and technical documentation

## Limitations

- Current collection covers the Security log on DC01 only.
- A single authentication failure does not establish malicious activity.
- Authentication logs do not reveal the passwords attempted.
- Detection thresholds require further testing before use in production.
- Manual searches are separate from scheduled alerts.
- Event counts may differ from the number of commands executed.

## Scope

All simulations are performed exclusively on virtual machines
and test accounts that I control within this lab.
