"""Run in the Python environment supplied/configured by your local CST installation.
Creates geometry only. No solver is launched; no simulation result is fabricated.
"""
from pathlib import Path
import argparse

def main():
 p=argparse.ArgumentParser(); p.add_argument('--output', required=True, help='New .cst file path'); args=p.parse_args()
 output=Path(args.output).expanduser().resolve()
 if output.suffix.lower()!='.cst': raise SystemExit('Output must end in .cst')
 if output.exists(): raise SystemExit('Refusing to overwrite an existing project')
 if not output.parent.is_dir(): raise SystemExit('Create the output directory first')
 try: import cst.interface
 except ImportError: raise SystemExit('CST Python API unavailable. Use the CST-provided Python environment or run BuildGeometry.bas in the GUI.')
 history=Path(__file__).with_name('geometry_history.vba').read_text(encoding='utf-8')
 de=cst.interface.DesignEnvironment()
 project=de.new_mws()
 project.model3d.add_to_history('Draft dual-layer loaded resonators - geometry only',history)
 project.save(str(output))
 print('Saved draft geometry:',output)
 print('Add the two RLC elements, periodic boundaries, Floquet excitation, mesh and solver settings as described in README_zh.md. Not solved.')
if __name__=='__main__': main()
