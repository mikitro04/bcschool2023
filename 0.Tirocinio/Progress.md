# Tutti i progressi svolti durante il tirocinio

## Giorno 1 - 25 Novembre 2025

### Inizio ore 10:00

Ho iniziato a leggere con attenzione dal file `Solidity.pdf` fornite dal docente prendendo appunti man mano. Da subito ho iniziato ad approfondire ciò che trovavo scritto, partendo dal concetto di _dApps e blockchain_ dal sito [Crypto](https://crypto.com/it/university/what-are-dapps-decentralised-applications) e dal sito [Inos](https://www.ionos.it/digitalguide/siti-web/programmazione-del-sito-web/dapp/).

Le slides sucessive parlano di Metamask dunque mi sono visto e scaricato l'estensione dai siti forniti.

Ho visto l'introduzione a Remix e scaricato il compilatore Solc nel mio computer.

Vedendo da slide l'introduzione a **Solidity** oltre leggere il materiale fornito ho iniziato a leggere la documentazione dal sito ufficiale [Solidity](https://docs.soliditylang.org/en/stable/introduction-to-smart-contracts.html) sia per quanto riguarda la struttura del file che per il tipo di documentazione [NatSpec](https://docs.soliditylang.org/en/latest/natspec-format.html).

### Fine ore 13:00

## Giorno 2 - 26 Novembre 2025

### Inizio ore 10:00

Mi sono iniziato a vedere più seriamente la sintassi di Solidity

### Pausa 10:33

### Ripreso 15:11

Ho utilizzato **Remix** per scrivere l'_esercizio 1_ e ho inviato nella rete di Sepolia il contratto dell'esercizio.

Ho iniziato a vedere le funzioni e approfondito il concetto di **Pure** e **View**. Ho anche approfondito le `call(...)` `delegatecall(...)` e `staticcall(...)` e le differenze tra di loro.

### Fine 16:37

## Giorno 3 - 27 Novembre 2025

### Inizio 15:17

Introduzione alla _visibilità_ delle funzioni e differenziazione di ogniuna.

Ho iniziato a vedere i tipi e le modalità di ritorno delle funzioni.

### Fine 16:20

## Giorno 4 - 28 Novembre 2025

### Inizio 11:00

Creazione _[file excel](OreTotali.ods)_ per il conteggio totale delle ore.

Setup di tutto l'ambiente sul fisso.

### Pausa 11:56

### Ripreso 12:22

Esercizio 3 e 4 del file [Solidity.pdf](../Slides/Solidity.pdf)

### Pausa 12:54

### Ripreso 15:20

Approfondito i tipi principali di variabili dal [sito ufficiale](https://docs.soliditylang.org/en/latest/units-and-global-variables.html)

Arrivato a Slide 50

### Fine 16:46

## Giorno 5 - 1 Dicembre 2025

## Inizio 11:47

Ho iniziato a guardare un video della durata totale di 4h per velocizzare l'apprendimento e la comprensione di _**Solidity**_. Ho per lo più fatto un ripasso di quello visto fin'ora ma in mezz'ora.

[Video](https://youtu.be/AYpftDFiIgk?si=V4AD7nmQknXxR2Un&t=1965) Fino a min 33 min circa

### Fine 12:15

## Giorno 6 - 2 Dicembre 2025

### Inizio 10:42

[Fino a 1:05:58](https://youtu.be/AYpftDFiIgk?si=X9NuEOkMeqIw_j_-&t=3958)

### Pausa 12:04

### Ripreso 14:23

### Pausa 15:00

### Ripreso 15:19

[Fino a 1:45:49](https://youtu.be/AYpftDFiIgk?si=mcNAFYOuX_bLpk1a&t=6349)

### Fine 16:08

## Giorno 7 - 5 Dicembre 2025

### Inizio 15:52

Approfondito `Events`, sia la dichiarazione che l'_emit_, e approfondito la verifica del codice, della transazione e la visualizzazione degli eventi

### Pausa 16:44

### Ripreso 17:38

### pausa 18:31

[Fino a 2:18:49](https://youtu.be/AYpftDFiIgk?si=ACVA4jdZTbD2bQIR)

## Giorno 8 - 7 Dicembre 2025

### Inizio 14:45

[Fino a 2:49:33](https://youtu.be/AYpftDFiIgk?si=9gNtudc9NZ2Bya7y&t=10173)

### Fine 15:34

## Giorno 9 - 8 Marzo 2026

### Inizio 10:41

Ho incominciato leggendo [l'articolo](https://develweb3.com/en/account-abstraction/) e prendendo nota delle terminologie:

Inizialmemte l'articolo riporta un breve paragrafo su cosa sia l'**account abstraction** e di come un nuovo tipo di account _smart wallet account_ o semplicemente _smart account_ possa essere usato per estendere la logica dietro i limiti convenzionali di un semplice EOA<sup>[1](#eoa)</sup>.

In che modo l'AA migliorerebbe l'esperienza degli utenti, anche di chi non è familiare con il "mondo delle crypto"?

1. Cambiare il modello di pagamento da uno rigido ad uno flessibile: tipicamente in qualsiasi blockchain il gas viene pagato con una moneta nativa della rete (e.g. ETH). Con l'AA questo vincolo viene rimosso tramite il Paymaster che fa funzionare il tutto come una comune carta di debito e preleva una somma di USDC dal tuo portafoglio per coprire il costo del gas. Il vantaggio è evidente, non si deve più passare da un exchange per comprare piccole frazioni di ETH.

    Per transazioni sponsorizzate si intende che il gas non vien epagato direttamente dall'utente ma da terze parti, e viene fatto questo procedimento:

    UserOperation -> validateUserOp -> validatePaymasterUserOp -> Execution Loop -> postOp.

2. Migliorare il metodo di autenticazione rispetto alla classica _private key_, ma permettere altri metodi quali chiavi di accesso (passkeys), biometrica e multi-firme.

3. Sviluppare **nuovi meccanismi** per il **recupero dei conti** dato che quello attualmente in uso ovvero quello della frase di recupero.

4. Accorpare diverse transazioni un un'unica operazione (e.g. coniatura e trasferimento di un NFT in un'unico ordine).

Ora l'articolo affronta forse l'argomento più **importante** dell'AA:

#### ERC-4337 Architecture

ERC-4337 è lo standard più usato per l'AA su Etherium perchè la sua implementazione non necessita alcuna modifica a livello di consenso.

La componentistica principale è formata da:

* **UserOperations**: sono i precursori delle transazioni convenzionali della blockchain. Contengono informazioni come:
    * **nonce**: ovvero un contatore sequenziale che contiene il numero di operazioni effettuate. Serve a garantire che ogni operazione venga eseguita una sola volta e nell'ordine corretto.
    * **valori di pagamento del gas**
    * dati per interagire con uno _smart contract_
    * la **firma di autorizzazione delle transazioni**
* **Bundler**: questi servono per **confezionare la UserOperation** da un mempool, differente rispetto a quello convenzionalmente utilizzato nella blockchain, e mandarlo all'**EntryPoint**

* **EntryPoint**: uno smart contract _singleton_<sup>[2](#singleton)</sup>  che valida ed esegue le transazioni logiche.

* **Smart Account**: Uno smart contract che esegue transazioni nella blockchain e viene autorizzato dall'utente ceh controlla l'account. Si comporta come un il portafoglio dell'utente con logica aggiuntiva per migliorare l'esperienza dell'utente.

* **Paymaster**: uno smart contract _opzionale_ che "sponsorizza" il pagamento del gas delle transazioni per conto degli utenti. Questi accettano anche pagamenti più complessi come in token ERC-20, stablecoin, abbonamenti o pagamenti ricorrenti

* **Aggregator**: un'entità opzionale per gli smart accounts che cpmvalida e aggrega le firme da più operazioni utente.

![Architettura](/assets/architettura.png "Schema dell'architettura ERC-4337.")

#### UserOperation

Il punto iniziale dell'interazione utente-blockchain nell'ecosistema AA.

Aspetti fondamentali:

* Rappresentano una o più azioni da eseguire dallo smart account
* Contengono dati di verifica delle operazioni
* Definiscono mome verranno pagate le tasse sul gas
* Permettono di eseguire più azioni _atomicamente_

#### Bundlers

Loro sono responsabili dell'invio di UserOperations all'EntryPoint. Per ogni UserOperation valida, raccolgono una piccola tassa.

Le operazioni utente sono raccolte da uno o più mempool. Idealmente il mempool dovrebbe essere una rete peer-to-peer pubblica e senza permesso.

* **Rete P2P**: non devono lavorare isolati o comunicare tramite server, devono invece formare una rete dove ogni Bundler parla con gli altri; in pratica se tu invii una UserOperation al "Bundler A", questo la trasmette immediatamente al "Bundler B", "C" e così via. Se il "Bundler A" va offline, la tua operazione è già stata distribuita agli altri nodi della rete che possono processarla.
* **Pubblica**: la lista d'attesa delle operazioni è pubblica e visibile a tutti. Al giorno d'oggi molti Bundler utilizzano mempool privati, il che rende tutto più veloce ma centralizzato. L'ideale sarebbe quello di garantire maggiore trasparenza e impedire che chiunque possa nascondere male intenzioni.
* **Senza permesso**: chiunque può decidere di accendere un computer e diventare un Bundler senza dover chiedere autorizzazione ad un'azienda, iniziando a guadagnare impacchettando operazioni. Questo concetto di permissionless evita che si verifichi la **censura** da parte delle aziende che rilasciano queste autorizzazioni.

#### EntryPoint

L'EntryPoint agisce come entità centrale nell'architettura ERC-4337. Coordina la verifica e l'esecuzione delle UserOperations. Le due implementazioni in uso sono:

* **Versione 0.6 (0x5FF137D4FDCD49DCA30c7CF57E578a026d2789)**: La **prima versione** per vedere i casi d'uso reali. I nuovi sviluppi sono incoraggiati a utilizzare l'ultima versione.
* **Versione 0.7 (0x000000071727De22E5E9d8BAf0edAc6f37da032)**: la versione più recente, introducendo numerosi miglioramenti, anche se è attualmente supportata da pochi provider.


#### Note:
* <a id="eoa"></a> Nota **1**: EOA = External Owned Account
* <a id="singleton"></a> Nota **2**: singleton = è uno smart contract **univoco** per tutta la blockchain