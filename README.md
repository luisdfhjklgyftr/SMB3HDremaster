# smb3recomp (projeto educacional / fechado)

Ferramenta de estudo de recompilação estática para ROMs NES com mapper MMC3,
pensada para Super Mario Bros. 3. **Não contém código nem dados da Nintendo.**
Use apenas com uma ROM extraída do seu próprio cartucho.

## Build
    make
    ./smb3recomp selftest
    ./smb3recomp info   jogo.nes
    ./smb3recomp disasm jogo.nes --stats
    ./smb3recomp disasm jogo.nes --bank6 N --bank7 M --from C000 -o saida.txt

## Estado atual (Marco 1)
- Parser iNES + CRC32
- Tabela dos 151 opcodes oficiais do 6502
- Visão de memória do MMC3 ($C000/$E000 fixos; $8000/$A000 escolhidos por --bank6/--bank7)
- Disassembler recursivo a partir dos vetores NMI/RESET/IRQ (ou --from)
- Relatório de pontos não resolvidos (JMP indireto) e alvos em bancos desconhecidos

## Roteiro
2. Interpretador 6502 de referência + barramento MMC3 (validar com nestest)
3. Descoberta de funções por (banco, endereço) rastreando as escritas em $8000/$8001
4. Resolução de tabelas de saltos e do truque PHA/PHA/RTS
5. Gerador de C: instrução -> C, com verificação passo a passo contra o interpretador
6. Runtime: PPU, APU, MMC3 (IRQ de scanline), input, SDL2
