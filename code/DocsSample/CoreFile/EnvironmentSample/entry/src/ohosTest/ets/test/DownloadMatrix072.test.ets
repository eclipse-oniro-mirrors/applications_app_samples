/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { importDownloadFiles, writeDownloadMessage } from '../../../main/ets/model/DownloadFiles';
import { DownloadMatrixProbe } from './DownloadMatrixProbe';
import { logCase, logAssertion } from './EnvironmentTestSupport';

export default function downloadMatrix072Test(): void {
  describe('DownloadMatrix072', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001705
     * @tc.name EnvironmentSample_reentrantWriter_close_1704
     * @tc.desc Reenter writer at first stat, outer mask DFDF, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1704", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1704";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.closeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", " spaced "]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001706
     * @tc.name EnvironmentSample_reentrantWriter_success_1705
     * @tc.desc Reenter writer at first stat, outer mask DFFD, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1705", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1705";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", "资料.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001707
     * @tc.name EnvironmentSample_reentrantWriter_write_1706
     * @tc.desc Reenter writer at first stat, outer mask DFFD, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1706", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1706";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.writeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", "资料.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001708
     * @tc.name EnvironmentSample_reentrantWriter_close_1707
     * @tc.desc Reenter writer at first stat, outer mask DFFD, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1707", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1707";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.closeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", "资料.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001709
     * @tc.name EnvironmentSample_reentrantWriter_success_1708
     * @tc.desc Reenter writer at first stat, outer mask DFFF, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1708", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1708";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected03: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001710
     * @tc.name EnvironmentSample_reentrantWriter_write_1709
     * @tc.desc Reenter writer at first stat, outer mask DFFF, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1709", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1709";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.writeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        const expected03: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001711
     * @tc.name EnvironmentSample_reentrantWriter_close_1710
     * @tc.desc Reenter writer at first stat, outer mask DFFF, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1710", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1710";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.closeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        const expected03: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001712
     * @tc.name EnvironmentSample_reentrantWriter_success_1711
     * @tc.desc Reenter writer at first stat, outer mask FDDD, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1711", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1711";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, ["/download/report.txt->/sandbox/report.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/report.txt->/sandbox/report.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001713
     * @tc.name EnvironmentSample_reentrantWriter_write_1712
     * @tc.desc Reenter writer at first stat, outer mask FDDD, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1712", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1712";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.writeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, ["/download/report.txt->/sandbox/report.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/report.txt->/sandbox/report.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001714
     * @tc.name EnvironmentSample_reentrantWriter_close_1713
     * @tc.desc Reenter writer at first stat, outer mask FDDD, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1713", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1713";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.closeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, ["/download/report.txt->/sandbox/report.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/report.txt->/sandbox/report.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001715
     * @tc.name EnvironmentSample_reentrantWriter_success_1714
     * @tc.desc Reenter writer at first stat, outer mask FDDF, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1714", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1714";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", " spaced "]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001716
     * @tc.name EnvironmentSample_reentrantWriter_write_1715
     * @tc.desc Reenter writer at first stat, outer mask FDDF, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1715", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1715";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.writeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", " spaced "]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001717
     * @tc.name EnvironmentSample_reentrantWriter_close_1716
     * @tc.desc Reenter writer at first stat, outer mask FDDF, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1716", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1716";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.closeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", " spaced "]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001718
     * @tc.name EnvironmentSample_reentrantWriter_success_1717
     * @tc.desc Reenter writer at first stat, outer mask FDFD, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1717", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1717";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", "资料.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "copy:/download/资料.txt->/sandbox/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["/download/report.txt->/sandbox/report.txt", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001719
     * @tc.name EnvironmentSample_reentrantWriter_write_1718
     * @tc.desc Reenter writer at first stat, outer mask FDFD, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1718", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1718";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.writeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", "资料.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "copy:/download/资料.txt->/sandbox/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["/download/report.txt->/sandbox/report.txt", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001720
     * @tc.name EnvironmentSample_reentrantWriter_close_1719
     * @tc.desc Reenter writer at first stat, outer mask FDFD, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1719", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1719";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.closeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", "资料.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "copy:/download/资料.txt->/sandbox/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["/download/report.txt->/sandbox/report.txt", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001721
     * @tc.name EnvironmentSample_reentrantWriter_success_1720
     * @tc.desc Reenter writer at first stat, outer mask FDFF, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1720", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1720";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected03: string[] = ["preexisting.txt", "report.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "copy:/download/资料.txt->/sandbox/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001722
     * @tc.name EnvironmentSample_reentrantWriter_write_1721
     * @tc.desc Reenter writer at first stat, outer mask FDFF, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1721", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1721";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.writeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        const expected03: string[] = ["preexisting.txt", "report.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "copy:/download/资料.txt->/sandbox/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001723
     * @tc.name EnvironmentSample_reentrantWriter_close_1722
     * @tc.desc Reenter writer at first stat, outer mask FDFF, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1722", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1722";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.closeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        const expected03: string[] = ["preexisting.txt", "report.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "copy:/download/资料.txt->/sandbox/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001724
     * @tc.name EnvironmentSample_reentrantWriter_success_1723
     * @tc.desc Reenter writer at first stat, outer mask FFDD, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1723", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1723";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden"];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", ".hidden"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", ".hidden"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001725
     * @tc.name EnvironmentSample_reentrantWriter_write_1724
     * @tc.desc Reenter writer at first stat, outer mask FFDD, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1724", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1724";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.writeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden"];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", ".hidden"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", ".hidden"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001726
     * @tc.name EnvironmentSample_reentrantWriter_close_1725
     * @tc.desc Reenter writer at first stat, outer mask FFDD, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1725", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1725";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.closeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden"];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", ".hidden"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", ".hidden"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001727
     * @tc.name EnvironmentSample_reentrantWriter_success_1726
     * @tc.desc Reenter writer at first stat, outer mask FFDF, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1726", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1726";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001728
     * @tc.name EnvironmentSample_reentrantWriter_write_1727
     * @tc.desc Reenter writer at first stat, outer mask FFDF, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1727", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1727";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.descriptor = 0;
        const injected: Error = new Error("inner failure");
        inner.writeFailure = injected;
        let nested: boolean = false;
        let caught: Error | undefined = undefined;
        api.hook = (event: string): void => {
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            try {
              writeDownloadMessage("/inner", "nested", inner);
            } catch (error) {
              caught = error as Error;
            }
          }
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
  });
}
