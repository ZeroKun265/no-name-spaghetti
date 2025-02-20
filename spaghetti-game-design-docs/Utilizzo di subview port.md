# Utilizzo di subview port
Per poter mantenere il gioco in pixel art ma utilizzare splash art in HD, dobbiamo usare una *root viewport* di grandi dimensioni e poi utilizzare una *subview port* per la parte a bassa risoluzione

Per vedere meglio come funziona, una demo è presente in `demos/sub-viewport-demo`:
- `high_res.tscn` è la view port che effettivamente sarà la *principale*
- `low_res.tscn` è la view port che subirà l'upscaling (nearest)
- `Pink Hair Cute High School Anime Girl Transparent PNG Download.png` immagine *"HD"* di test
- `Piston.png` immagine pixel art di test

## High res
`high_res.tscn`: Inseriamo la scena low res all'interno della *high_res*
![[Pasted image 20250220230342.png]]
![[Pasted image 20250220230622.png]]
Queste sono le impostazioni del nodo *Low Res* da cambiare

## Low res
`low_res.tscn`: La scena *low_res* invece deve avere la seguente struttura vino alla *sub-view-port*, tutto va inserito dentro quella viewport
![[Pasted image 20250220230541.png]]

![[Pasted image 20250220231238.png]]
Queste sono le impostazioni da cambiare per *SubViewportContanier*

![[Pasted image 20250220231317.png]]
Queste sono le impostazioni da cambiare per *SubViewport*
