package zrtech_v2

import spinal.core._
import spinal.lib._

class Top extends Component {
  val RSTn = in Bool
  val CLK  = in Bool

  val leds = new Bundle {
    val d2_n = out Bool
    val d3_n = out Bool
    val d4_n = out Bool
    val d5_n = out Bool
  }

  val keys = new Bundle {
    val Key1 = in Bool
    val Key2 = in Bool
    val Key3 = in Bool
    val Key4 = in Bool
  }

  val topClockDomain = ClockDomain(
    clock = CLK,
    reset = RSTn,
    frequency = new FixedFrequency(50 MHz),
    config = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = ASYNC,
      resetActiveLevel = LOW
    )
  )

  val clockedArea = new ClockingArea(topClockDomain) {
    val counter = Reg(UInt(26 bits)) init(0)
    val state   = Reg(Bool) init(True)
    val clockDivider = (topClockDomain.frequency.getValue / new FixedFrequency(1 Hz).getValue).toInt

    counter := counter + 1

    when(counter === clockDivider) {
      state := !state
      counter := 0
    }

    leds.d2_n := state
    leds.d3_n := state
    leds.d4_n := state
    leds.d5_n := state
  }

}

object TopLevelVhdl {
  def main(args: Array[String]) {
    SpinalVhdl(new Top)
  }
}
