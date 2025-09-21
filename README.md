<h1 align="center">Hi 👋, I'm Dhairyshil.Chavan</h1>
<h3 align="center">A passionate Design Verification Engineer.</h3>

- 🌱 I’m currently learning **Design Verification**

- 👨‍💻 All of my projects are available at [https://github.com/Dhairyshil30](https://github.com/Dhairyshil30)

- 📫 How to reach me **dhairyshil.chavan09@gmail.com**

- ⚡ Fun fact **I use tabs over spaces**

<h3 align="left">Connect with me:</h3>
<p align="left">
</p>



## Connect with me  
<div align="center">
<a href="https://github.com/Dhairyshil30" target="_blank">
<img src=https://img.shields.io/badge/github-%2324292e.svg?&style=for-the-badge&logo=github&logoColor=white alt=github style="margin-bottom: 5px;" />
</a>
<a href="https://linkedin.com/in/Dhairyshil Chavan" target="_blank">
<img src=https://img.shields.io/badge/linkedin-%231E77B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white alt=linkedin style="margin-bottom: 5px;" />
</a>  
</div>  
  

<br/>  


---
# Memory Project — SystemVerilog

**Brief:**
This repository contains a parameterized memory RTL implemented in SystemVerilog and a self-checking SystemVerilog testbench used to verify functionality. The verification flow uses randomized stimulus, assertions, simple scoreboard checks, and waveform dumping to validate read/write behavior and corner cases.

---

## Key Features

* Parameterized memory (WIDTH, DEPTH) in `src/`
* Standard read/write interface (clock, reset, addr, data\_in, data\_out, write\_enable)
* Self-checking testbench with randomized stimulus and deterministic seed support
* Assertion checks for protocol correctness and basic coverage points
* Waveform/VCD output for debugging

---

## Recommended Repo Structure

```plaintext
/ (root)
├─ src/
│  └─ memory.sv           # RTL
├─ tb/
│  ├─ memory_tb.sv        # top-level testbench
│  ├─ memory_agent.sv     # (optional) stimulus driver/monitor
│  └─ sequences.sv        # (optional) constrained-random tests
├─ sim/
│  ├─ run_questasim.sh
│  └─ run_vcs.sh
└─ README.md
```

---

## Prerequisites

* SystemVerilog-capable simulator (Questa/ModelSim, VCS, or similar)
* (Optional) GTKWave for viewing VCDs
* Basic Unix shell or Windows command-line

---

## Quick Start (Step-by-Step)

### 1. Clone the Repo

```bash
git clone <your-repo-url>
cd <repo-folder>
```

### 2. Compile + Simulate (Questa/ModelSim Example)

```bash
# create work library, compile SV sources
vlib work
vlog -sv src/*.sv tb/*.sv
# run testbench (command-line mode)
vsim -c work.memory_tb -do "run -all; quit"
```

### 3. Compile + Simulate (Synopsys VCS Example)

```bash
vcs -full64 -sverilog src/*.sv tb/*.sv -o simv
# run (optionally pass a seed)
./simv +seed=123 | tee sim.log
```

### 4. Generate Waveform (VCD) from Testbench

Add this block if not already present in the testbench:

```systemverilog
initial begin
  $dumpfile("waves.vcd");
  $dumpvars(0, memory_tb);
end
```

After simulation, open with GTKWave:

```bash
gtkwave waves.vcd
```

### 5. Check Results

```bash
grep -i "pass\|fail" sim.log || true
```

Use assertions and scoreboard messages to locate failures.

### 6. Run Regression / Multiple Seeds

```bash
for s in 1 2 3 4 5; do ./simv +seed=$s | tee sim_seed_${s}.log; done
```

---

## Verification Approach

1. Reset and basic sanity checks.
2. Constrained-random stimulus to generate read/write patterns across the address range.
3. Self-checking scoreboard compares DUT behavior against a reference model (simple array or file-backed memory model).
4. Assertions catch protocol errors (e.g., illegal writes during read-only windows).
5. Waveform/VCD + log tracing for failing cases.
6. (Optional) Coverage points for address ranges, data patterns, and control signals.

---

## How to Extend

* Add more sequences in `tb/sequences.sv` for corner cases (e.g., back-to-back writes to the same addr).
* Add functional coverage bins to measure which address ranges / data patterns are being exercised.
* Add a small Python or Shell script in `sim/` to automate regressions and result collection.

---

## Tips & Common Commands

* Fix a seed during debugging to reproduce failures: `+seed=123`.
* Use `$display` liberally in the scoreboard/monitor during development, then switch to assertions for automated checking.
* Keep testbench modular: driver, monitor, scoreboard make it easier to scale tests.

---

## License & Contact

* License: MIT (or choose your license)
* Issues / questions: open an issue in this repository or contact the author.

---

✅ This README is in **Markdown format** and ready for GitHub.
