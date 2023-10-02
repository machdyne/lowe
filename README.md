# Löwe FPGA Board

Löwe is an open-source FPGA development board for the Cologne Chip GateMate CCGM1A1.

![Löwe FPGA Board](https://github.com/machdyne/lowe/blob/2ebf3f84a9dffbef5f0a59aada39bb4e460ef6d9/lowe.png)

This repo contains PCB layouts, schematics, pinouts and example gateware.

Find more information on the [Löwe product page](https://machdyne.com/product/lowe-fpga-board/).

## Examples

In order to build the examples, first edit rtl/config.mk and set the paths to the location of your toolchain. You can download the toolchain from [Cologne Chip](https://colognechip.com).

You can build each example with:

```
$ make && make impl
```

You can then use [openFPGALoader](https://github.com/trabucayre/openFPGALoader) to write the gateware to SRAM or flash, using a Raspberry Pi Pico or [Werkzeug](https://github.com/machdyne/werkzeug) (loaded with [pico-dirtyJtag](https://github.com/phdussud/pico-dirtyJtag)) in this example:

```
$ openFPGALoader -c dirtyJtag count_00.cfg.bit
```

## Configuration Mode Selection

The board has 4 DIP switches that select the configuration mode:

| Switches | Mode |
| -------- | ------ |
| 0000 | SPI Active Mode (CPOL=0 CPHA=0) |
| 0001 | SPI Active Mode (CPOL=0 CPHA=1) |
| 0010 | SPI Active Mode (CPOL=1 CPHA=0) |
| 0011 | SPI Active Mode (CPOL=1 CPHA=1) |
| 0100 | SPI Passive Mode (CPOL=0 CPHA=0) |
| 0101 | SPI Passive Mode (CPOL=0 CPHA=1) |
| 0110 | SPI Passive Mode (CPOL=1 CPHA=0) |
| 0111 | SPI Passive Mode (CPOL=1 CPHA=1) |
| 1100 | JTAG |

## MMOD Header

See the [MMOD repo](https://github.com/machdyne/mmod/) for details.

## JTAG Header

The 3.3V JTAG header can be used to program the FPGA SRAM as well as the MMOD flash memory.

```
5 3 1
6 4 2
```

| Pin | Signal |
| --- | ------ |
| 1 | TCK |
| 2 | TDI |
| 3 | TDO |
| 4 | TMS |
| 5 | 5V0[^1] |
| 6 | GND |

[^1]: This pin can be used to power the board with an external regulated 5V power supply, instead of USB power.

## Funding

This project was partially funded through the NGI0 Entrust Fund, a fund established by NLnet with financial support from the European Commission's Next Generation Internet programme.

## License

The contents of this repo are released under the [Lone Dynamics Open License](LICENSE.md) with the following exceptions:

- The KiCad design files contain parts of the [kicad-pmod](https://github.com/mithro/kicad-pmod) library which is released under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0.html).

- The KiCad design files may contain symbols and footprints released under other licenses; please contact us if we've failed to give proper attribution.

Note: You can use these designs for commercial purposes but we ask that instead of producing exact clones, that you either replace our trademarks and logos with your own or add your own next to ours.
