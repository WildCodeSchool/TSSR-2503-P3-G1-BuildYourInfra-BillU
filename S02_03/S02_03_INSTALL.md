# 🖥️ Guide installation sprint 2-3

## Sommaire

### 1. [Paramétrage des IP](#Paramétrage-des-IP)  

### 1 Paramétrage des IP  
<span id="Paramétrage-des-IP"></span>
Nous allons configurer les machines pour atteindre cette configuration finale : 

| Nom   | OS       | IP | DNS primaire |
| :-: | :-: | :-: | :-: |
| 552 (G1-WINSRVGUI01) | Windows Server 2022 GUI | 172.16.10.1/24| 127.0.0.1 |
| 553 (G1-LINSRV01) | Debian 12. | 172.16.10.3/24| 172.16.10.1 |
| 554 (G1-WINSRVCORE01) | Windows Server 2022 Core | 172.16.10.2/24| 172.16.10.1 |
| 565 (G1-WINCLI01) | Windows 10 | 172.16.20.10/24| 172.16.10.1 |
| 564 (G1-WINCLI02) | Windows 10 | 172.16.20.10/24| 172.16.10.1 |

#### Configuration AD-DS sur Windows Server 2022 GUI


```bash
ls -a | grep "nanani"
```
