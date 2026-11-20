# CameraSample headless model tests

These tests directly import the production `Comment` model and `Constants` class. They do not launch an Ability, render components, access camera hardware, request permissions, or simulate the camera result callback.

The reference directory contributes 78 suites plus `Ability.test.ets`; each has one corresponding target suite whose physical line count is at least the original count. `List.test.ets` registers all 79 suites. `OpenHarmonyTestRunner.ets` dispatches Hypium directly.

| Item | Count |
| --- | ---: |
| Test cases | 1,702 |
| Case-containing files | 79 |
| Suite physical lines | 68,520 |
| Suite code-bearing lines, excluding comments and blanks | 55,342 |
| All ETS physical lines | 68,765 |

Each case has six metadata tags and a unique name. Expected values are independent literals. The matrix varies empty values, whitespace, multiline text, punctuation, Unicode, long text, numeric boundaries, timestamp strings, ordered image values, reset assignments, shared-array aliases, copied-array isolation, and separate Comment instances. These checks describe the model's storage behavior; they do not claim application-level validation or image decoding.

`headless-test-manifest.json` records each reference-to-target mapping and every explicit scenario/input tuple. The generator is reproducible:

```sh
python3 generator/generate_headless_tests.py \
  --reference /path/to/TVPowerDialog/entry/src/ohosTest \
  --output /path/to/CameraSample/entry/src/ohosTest
```

Regeneration replaces the generated ETS directory and test module manifest. Existing production files are not changed. The generator retains itself and this documentation.

Validation performed: local relative imports resolve, all mapped suites satisfy their line minimum, names and metadata are complete, the ETS parser reports no syntax diagnostics, and no UI/testability/delay/console dependencies occur. Device execution and project compilation were not run, as requested.
