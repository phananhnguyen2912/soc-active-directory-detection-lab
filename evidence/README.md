# Evidence

| Screenshot | What it shows |
|---|---|
| [failed-logon-client.png](failed-logon-client.png) | Failed authentication and error 1326 on CLIENT01 |
| [failed-logon-splunk.png](failed-logon-splunk.png) | Corresponding Windows Security event 4625 in Splunk |
| [password-spraying-client.png](password-spraying-client.png) | Password-spraying test activity on CLIENT01 |
| [password-spraying-detection.png](password-spraying-detection.png) | Password-spraying query results in Splunk |
| [password-spraying-event-details.png](password-spraying-event-details.png) | Detailed timeline including two earlier failed logon tests |
| [brute-force-lockout-policy.png](brute-force-lockout-policy.png) | Lockout threshold, duration, and observation window for labuser10 |
| [brute-force-ad-lockout-state.png](brute-force-ad-lockout-state.png) | Active Directory account state when the bad-password count reached five |
| [brute-force-splunk-lockout-event.png](brute-force-splunk-lockout-event.png) | Raw Windows Security event 4740 on DC01 |
| [brute-force-sixth-attempt-locked.png](brute-force-sixth-attempt-locked.png) | CLIENT01 error 1909 while the account was locked |
| [brute-force-success-after-unlock.png](brute-force-success-after-unlock.png) | Successful network connection on CLIENT01 after the unlock |
| [brute-force-splunk-timeline.png](brute-force-splunk-timeline.png) | Splunk timeline covering logon failures, lockout, unlock, and subsequent success |
| [brute-force-splunk-pre-lockout-kerberos-logon.png](brute-force-splunk-pre-lockout-kerberos-logon.png) | Raw event 4624 for a Kerberos network logon before the lockout |
