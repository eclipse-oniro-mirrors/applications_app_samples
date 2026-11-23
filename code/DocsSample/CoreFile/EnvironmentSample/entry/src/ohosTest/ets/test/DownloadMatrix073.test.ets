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

export default function downloadMatrix073Test(): void {
  describe('DownloadMatrix073', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001729
     * @tc.name EnvironmentSample_reentrantWriter_close_1728
     * @tc.desc Reenter writer at first stat, outer mask FFDF, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1728", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1728";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001730
     * @tc.name EnvironmentSample_reentrantWriter_success_1729
     * @tc.desc Reenter writer at first stat, outer mask FFFD, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1729", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1729";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
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
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001731
     * @tc.name EnvironmentSample_reentrantWriter_write_1730
     * @tc.desc Reenter writer at first stat, outer mask FFFD, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1730", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1730";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
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
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001732
     * @tc.name EnvironmentSample_reentrantWriter_close_1731
     * @tc.desc Reenter writer at first stat, outer mask FFFD, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1731", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1731";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
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
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001733
     * @tc.name EnvironmentSample_reentrantWriter_success_1732
     * @tc.desc Reenter writer at first stat, outer mask FFFF, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1732", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1732";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
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
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001734
     * @tc.name EnvironmentSample_reentrantWriter_write_1733
     * @tc.desc Reenter writer at first stat, outer mask FFFF, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1733", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1733";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
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
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001735
     * @tc.name EnvironmentSample_reentrantWriter_close_1734
     * @tc.desc Reenter writer at first stat, outer mask FFFF, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1734", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1734";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
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
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected03);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001736
     * @tc.name EnvironmentSample_reentrantImport_1735
     * @tc.desc Reenter import at first stat, mask DDDD, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1735", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1735";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = [
          "/inner-download/ spaced ", "/inner-download/资料.txt", "/inner-download/.hidden",
          "/inner-download/report.txt",
        ];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected03: string[] = ["preexisting.txt", " spaced ", "资料.txt", ".hidden", "report.txt"];
        logAssertion(caseName, "innerResult", innerResult, expected03);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ",
          "copy:/inner-download/ spaced ->/inner-sandbox/ spaced ", "stat:/inner-download/资料.txt",
          "copy:/inner-download/资料.txt->/inner-sandbox/资料.txt", "stat:/inner-download/.hidden",
          "copy:/inner-download/.hidden->/inner-sandbox/.hidden", "stat:/inner-download/report.txt",
          "copy:/inner-download/report.txt->/inner-sandbox/report.txt", "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:copy:/inner-download/ spaced ->/inner-sandbox/ spaced ",
          "inner:stat:/inner-download/资料.txt", "inner:copy:/inner-download/资料.txt->/inner-sandbox/资料.txt",
          "inner:stat:/inner-download/.hidden", "inner:copy:/inner-download/.hidden->/inner-sandbox/.hidden",
          "inner:stat:/inner-download/report.txt",
          "inner:copy:/inner-download/report.txt->/inner-sandbox/report.txt", "inner:list:/inner-sandbox",
          "outer:stat:/download/.hidden", "outer:stat:/download/资料.txt", "outer:stat:/download/ spaced ",
          "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        const expected08: string[] = [
          "/inner-download/ spaced ->/inner-sandbox/ spaced ", "/inner-download/资料.txt->/inner-sandbox/资料.txt",
          "/inner-download/.hidden->/inner-sandbox/.hidden",
          "/inner-download/report.txt->/inner-sandbox/report.txt",
        ];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected11: string[] = ["preexisting.txt", " spaced ", "资料.txt", ".hidden", "report.txt"];
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, expected11);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(expected11));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001737
     * @tc.name EnvironmentSample_reentrantImport_1736
     * @tc.desc Reenter import at first stat, mask DDDF, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1736", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1736";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/资料.txt", "/inner-download/.hidden", "/inner-download/report.txt"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
        const expected03: string[] = ["preexisting.txt", "资料.txt", ".hidden", "report.txt"];
        logAssertion(caseName, "innerResult", innerResult, expected03);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ", "stat:/inner-download/资料.txt",
          "copy:/inner-download/资料.txt->/inner-sandbox/资料.txt", "stat:/inner-download/.hidden",
          "copy:/inner-download/.hidden->/inner-sandbox/.hidden", "stat:/inner-download/report.txt",
          "copy:/inner-download/report.txt->/inner-sandbox/report.txt", "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:stat:/inner-download/资料.txt",
          "inner:copy:/inner-download/资料.txt->/inner-sandbox/资料.txt", "inner:stat:/inner-download/.hidden",
          "inner:copy:/inner-download/.hidden->/inner-sandbox/.hidden", "inner:stat:/inner-download/report.txt",
          "inner:copy:/inner-download/report.txt->/inner-sandbox/report.txt", "inner:list:/inner-sandbox",
          "outer:stat:/download/.hidden", "outer:stat:/download/资料.txt", "outer:stat:/download/ spaced ",
          "outer:copy:/download/ spaced ->/sandbox/ spaced ", "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        logAssertion(caseName, "api.copied", api.copied, ["/download/ spaced ->/sandbox/ spaced "]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/ spaced ->/sandbox/ spaced "]));
        const expected08: string[] = [
          "/inner-download/资料.txt->/inner-sandbox/资料.txt", "/inner-download/.hidden->/inner-sandbox/.hidden",
          "/inner-download/report.txt->/inner-sandbox/report.txt",
        ];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
        const expected11: string[] = ["preexisting.txt", "资料.txt", ".hidden", "report.txt"];
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, expected11);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(expected11));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001738
     * @tc.name EnvironmentSample_reentrantImport_1737
     * @tc.desc Reenter import at first stat, mask DDFD, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1737", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1737";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/ spaced ", "/inner-download/.hidden", "/inner-download/report.txt"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
        const expected03: string[] = ["preexisting.txt", " spaced ", ".hidden", "report.txt"];
        logAssertion(caseName, "innerResult", innerResult, expected03);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ",
          "copy:/inner-download/ spaced ->/inner-sandbox/ spaced ", "stat:/inner-download/资料.txt",
          "stat:/inner-download/.hidden", "copy:/inner-download/.hidden->/inner-sandbox/.hidden",
          "stat:/inner-download/report.txt", "copy:/inner-download/report.txt->/inner-sandbox/report.txt",
          "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:copy:/inner-download/ spaced ->/inner-sandbox/ spaced ",
          "inner:stat:/inner-download/资料.txt", "inner:stat:/inner-download/.hidden",
          "inner:copy:/inner-download/.hidden->/inner-sandbox/.hidden", "inner:stat:/inner-download/report.txt",
          "inner:copy:/inner-download/report.txt->/inner-sandbox/report.txt", "inner:list:/inner-sandbox",
          "outer:stat:/download/.hidden", "outer:stat:/download/资料.txt",
          "outer:copy:/download/资料.txt->/sandbox/资料.txt", "outer:stat:/download/ spaced ", "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        logAssertion(caseName, "api.copied", api.copied, ["/download/资料.txt->/sandbox/资料.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/资料.txt->/sandbox/资料.txt"]));
        const expected08: string[] = [
          "/inner-download/ spaced ->/inner-sandbox/ spaced ", "/inner-download/.hidden->/inner-sandbox/.hidden",
          "/inner-download/report.txt->/inner-sandbox/report.txt",
        ];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
        const expected11: string[] = ["preexisting.txt", " spaced ", ".hidden", "report.txt"];
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, expected11);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(expected11));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001739
     * @tc.name EnvironmentSample_reentrantImport_1738
     * @tc.desc Reenter import at first stat, mask DDFF, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1738", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1738";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/.hidden", "/inner-download/report.txt"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "资料.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt", " spaced "]));
        logAssertion(caseName, "innerResult", innerResult, ["preexisting.txt", ".hidden", "report.txt"]);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", "report.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ", "stat:/inner-download/资料.txt",
          "stat:/inner-download/.hidden", "copy:/inner-download/.hidden->/inner-sandbox/.hidden",
          "stat:/inner-download/report.txt", "copy:/inner-download/report.txt->/inner-sandbox/report.txt",
          "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:stat:/inner-download/资料.txt",
          "inner:stat:/inner-download/.hidden", "inner:copy:/inner-download/.hidden->/inner-sandbox/.hidden",
          "inner:stat:/inner-download/report.txt",
          "inner:copy:/inner-download/report.txt->/inner-sandbox/report.txt", "inner:list:/inner-sandbox",
          "outer:stat:/download/.hidden", "outer:stat:/download/资料.txt",
          "outer:copy:/download/资料.txt->/sandbox/资料.txt", "outer:stat:/download/ spaced ",
          "outer:copy:/download/ spaced ->/sandbox/ spaced ", "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected07);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] =
          [
            "/inner-download/.hidden->/inner-sandbox/.hidden",
            "/inner-download/report.txt->/inner-sandbox/report.txt",
          ];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        const expected10: string[] = ["preexisting.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected10);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected10));
        const expected11: string[] = ["preexisting.txt", ".hidden", "report.txt"];
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, expected11);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(expected11));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001740
     * @tc.name EnvironmentSample_reentrantImport_1739
     * @tc.desc Reenter import at first stat, mask DFDD, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1739", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1739";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/ spaced ", "/inner-download/资料.txt", "/inner-download/report.txt"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        const expected03: string[] = ["preexisting.txt", " spaced ", "资料.txt", "report.txt"];
        logAssertion(caseName, "innerResult", innerResult, expected03);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ",
          "copy:/inner-download/ spaced ->/inner-sandbox/ spaced ", "stat:/inner-download/资料.txt",
          "copy:/inner-download/资料.txt->/inner-sandbox/资料.txt", "stat:/inner-download/.hidden",
          "stat:/inner-download/report.txt", "copy:/inner-download/report.txt->/inner-sandbox/report.txt",
          "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:copy:/inner-download/ spaced ->/inner-sandbox/ spaced ",
          "inner:stat:/inner-download/资料.txt", "inner:copy:/inner-download/资料.txt->/inner-sandbox/资料.txt",
          "inner:stat:/inner-download/.hidden", "inner:stat:/inner-download/report.txt",
          "inner:copy:/inner-download/report.txt->/inner-sandbox/report.txt", "inner:list:/inner-sandbox",
          "outer:stat:/download/.hidden", "outer:copy:/download/.hidden->/sandbox/.hidden",
          "outer:stat:/download/资料.txt", "outer:stat:/download/ spaced ", "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        logAssertion(caseName, "api.copied", api.copied, ["/download/.hidden->/sandbox/.hidden"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/.hidden->/sandbox/.hidden"]));
        const expected08: string[] = [
          "/inner-download/ spaced ->/inner-sandbox/ spaced ", "/inner-download/资料.txt->/inner-sandbox/资料.txt",
          "/inner-download/report.txt->/inner-sandbox/report.txt",
        ];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        const expected11: string[] = ["preexisting.txt", " spaced ", "资料.txt", "report.txt"];
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, expected11);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(expected11));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001741
     * @tc.name EnvironmentSample_reentrantImport_1740
     * @tc.desc Reenter import at first stat, mask DFDF, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1740", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1740";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/资料.txt", "/inner-download/report.txt"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", " spaced "]));
        logAssertion(caseName, "innerResult", innerResult, ["preexisting.txt", "资料.txt", "report.txt"]);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt", "report.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ", "stat:/inner-download/资料.txt",
          "copy:/inner-download/资料.txt->/inner-sandbox/资料.txt", "stat:/inner-download/.hidden",
          "stat:/inner-download/report.txt", "copy:/inner-download/report.txt->/inner-sandbox/report.txt",
          "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:stat:/inner-download/资料.txt",
          "inner:copy:/inner-download/资料.txt->/inner-sandbox/资料.txt", "inner:stat:/inner-download/.hidden",
          "inner:stat:/inner-download/report.txt",
          "inner:copy:/inner-download/report.txt->/inner-sandbox/report.txt", "inner:list:/inner-sandbox",
          "outer:stat:/download/.hidden", "outer:copy:/download/.hidden->/sandbox/.hidden",
          "outer:stat:/download/资料.txt", "outer:stat:/download/ spaced ",
          "outer:copy:/download/ spaced ->/sandbox/ spaced ", "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected07);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] =
          ["/inner-download/资料.txt->/inner-sandbox/资料.txt", "/inner-download/report.txt->/inner-sandbox/report.txt"];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        const expected10: string[] = ["preexisting.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected10);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected10));
        const expected11: string[] = ["preexisting.txt", "资料.txt", "report.txt"];
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, expected11);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(expected11));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001742
     * @tc.name EnvironmentSample_reentrantImport_1741
     * @tc.desc Reenter import at first stat, mask DFFD, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1741", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1741";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/ spaced ", "/inner-download/report.txt"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", "资料.txt"]));
        logAssertion(caseName, "innerResult", innerResult, ["preexisting.txt", " spaced ", "report.txt"]);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(["preexisting.txt", " spaced ", "report.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ",
          "copy:/inner-download/ spaced ->/inner-sandbox/ spaced ", "stat:/inner-download/资料.txt",
          "stat:/inner-download/.hidden", "stat:/inner-download/report.txt",
          "copy:/inner-download/report.txt->/inner-sandbox/report.txt", "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:copy:/inner-download/ spaced ->/inner-sandbox/ spaced ",
          "inner:stat:/inner-download/资料.txt", "inner:stat:/inner-download/.hidden",
          "inner:stat:/inner-download/report.txt",
          "inner:copy:/inner-download/report.txt->/inner-sandbox/report.txt", "inner:list:/inner-sandbox",
          "outer:stat:/download/.hidden", "outer:copy:/download/.hidden->/sandbox/.hidden",
          "outer:stat:/download/资料.txt", "outer:copy:/download/资料.txt->/sandbox/资料.txt",
          "outer:stat:/download/ spaced ", "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected07);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] = [
          "/inner-download/ spaced ->/inner-sandbox/ spaced ",
          "/inner-download/report.txt->/inner-sandbox/report.txt",
        ];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        const expected10: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected10);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected10));
        const expected11: string[] = ["preexisting.txt", " spaced ", "report.txt"];
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, expected11);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(expected11));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001743
     * @tc.name EnvironmentSample_reentrantImport_1742
     * @tc.desc Reenter import at first stat, mask DFFF, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1742", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1742";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/report.txt"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        const expected02: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "innerResult", innerResult, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ", "stat:/inner-download/资料.txt",
          "stat:/inner-download/.hidden", "stat:/inner-download/report.txt",
          "copy:/inner-download/report.txt->/inner-sandbox/report.txt", "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:stat:/inner-download/资料.txt",
          "inner:stat:/inner-download/.hidden", "inner:stat:/inner-download/report.txt",
          "inner:copy:/inner-download/report.txt->/inner-sandbox/report.txt", "inner:list:/inner-sandbox",
          "outer:stat:/download/.hidden", "outer:copy:/download/.hidden->/sandbox/.hidden",
          "outer:stat:/download/资料.txt", "outer:copy:/download/资料.txt->/sandbox/资料.txt",
          "outer:stat:/download/ spaced ", "outer:copy:/download/ spaced ->/sandbox/ spaced ",
          "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = [
          "/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected07);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] = ["/inner-download/report.txt->/inner-sandbox/report.txt"];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        const expected10: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected10);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected10));
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001744
     * @tc.name EnvironmentSample_reentrantImport_1743
     * @tc.desc Reenter import at first stat, mask FDDD, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1743", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1743";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/ spaced ", "/inner-download/资料.txt", "/inner-download/.hidden"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
        const expected03: string[] = ["preexisting.txt", " spaced ", "资料.txt", ".hidden"];
        logAssertion(caseName, "innerResult", innerResult, expected03);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ",
          "copy:/inner-download/ spaced ->/inner-sandbox/ spaced ", "stat:/inner-download/资料.txt",
          "copy:/inner-download/资料.txt->/inner-sandbox/资料.txt", "stat:/inner-download/.hidden",
          "copy:/inner-download/.hidden->/inner-sandbox/.hidden", "stat:/inner-download/report.txt",
          "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:copy:/inner-download/ spaced ->/inner-sandbox/ spaced ",
          "inner:stat:/inner-download/资料.txt", "inner:copy:/inner-download/资料.txt->/inner-sandbox/资料.txt",
          "inner:stat:/inner-download/.hidden", "inner:copy:/inner-download/.hidden->/inner-sandbox/.hidden",
          "inner:stat:/inner-download/report.txt", "inner:list:/inner-sandbox",
          "outer:copy:/download/report.txt->/sandbox/report.txt", "outer:stat:/download/.hidden",
          "outer:stat:/download/资料.txt", "outer:stat:/download/ spaced ", "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        logAssertion(caseName, "api.copied", api.copied, ["/download/report.txt->/sandbox/report.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/report.txt->/sandbox/report.txt"]));
        const expected08: string[] = [
          "/inner-download/ spaced ->/inner-sandbox/ spaced ", "/inner-download/资料.txt->/inner-sandbox/资料.txt",
          "/inner-download/.hidden->/inner-sandbox/.hidden",
        ];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
        const expected11: string[] = ["preexisting.txt", " spaced ", "资料.txt", ".hidden"];
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, expected11);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(expected11));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001745
     * @tc.name EnvironmentSample_reentrantImport_1744
     * @tc.desc Reenter import at first stat, mask FDDF, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1744", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1744";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/资料.txt", "/inner-download/.hidden"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", " spaced "]));
        logAssertion(caseName, "innerResult", innerResult, ["preexisting.txt", "资料.txt", ".hidden"]);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt", ".hidden"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ", "stat:/inner-download/资料.txt",
          "copy:/inner-download/资料.txt->/inner-sandbox/资料.txt", "stat:/inner-download/.hidden",
          "copy:/inner-download/.hidden->/inner-sandbox/.hidden", "stat:/inner-download/report.txt",
          "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:stat:/inner-download/资料.txt",
          "inner:copy:/inner-download/资料.txt->/inner-sandbox/资料.txt", "inner:stat:/inner-download/.hidden",
          "inner:copy:/inner-download/.hidden->/inner-sandbox/.hidden", "inner:stat:/inner-download/report.txt",
          "inner:list:/inner-sandbox", "outer:copy:/download/report.txt->/sandbox/report.txt",
          "outer:stat:/download/.hidden", "outer:stat:/download/资料.txt", "outer:stat:/download/ spaced ",
          "outer:copy:/download/ spaced ->/sandbox/ spaced ", "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected07);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] =
          ["/inner-download/资料.txt->/inner-sandbox/资料.txt", "/inner-download/.hidden->/inner-sandbox/.hidden"];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        const expected10: string[] = ["preexisting.txt", "report.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected10);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected10));
        const expected11: string[] = ["preexisting.txt", "资料.txt", ".hidden"];
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, expected11);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(expected11));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001746
     * @tc.name EnvironmentSample_reentrantImport_1745
     * @tc.desc Reenter import at first stat, mask FDFD, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1745", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1745";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/ spaced ", "/inner-download/.hidden"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", "资料.txt"]));
        logAssertion(caseName, "innerResult", innerResult, ["preexisting.txt", " spaced ", ".hidden"]);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(["preexisting.txt", " spaced ", ".hidden"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "copy:/download/资料.txt->/sandbox/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ",
          "copy:/inner-download/ spaced ->/inner-sandbox/ spaced ", "stat:/inner-download/资料.txt",
          "stat:/inner-download/.hidden", "copy:/inner-download/.hidden->/inner-sandbox/.hidden",
          "stat:/inner-download/report.txt", "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:copy:/inner-download/ spaced ->/inner-sandbox/ spaced ",
          "inner:stat:/inner-download/资料.txt", "inner:stat:/inner-download/.hidden",
          "inner:copy:/inner-download/.hidden->/inner-sandbox/.hidden", "inner:stat:/inner-download/report.txt",
          "inner:list:/inner-sandbox", "outer:copy:/download/report.txt->/sandbox/report.txt",
          "outer:stat:/download/.hidden", "outer:stat:/download/资料.txt",
          "outer:copy:/download/资料.txt->/sandbox/资料.txt", "outer:stat:/download/ spaced ", "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["/download/report.txt->/sandbox/report.txt", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected07);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] =
          ["/inner-download/ spaced ->/inner-sandbox/ spaced ", "/inner-download/.hidden->/inner-sandbox/.hidden"];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        const expected10: string[] = ["preexisting.txt", "report.txt", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected10);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected10));
        const expected11: string[] = ["preexisting.txt", " spaced ", ".hidden"];
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, expected11);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(expected11));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001747
     * @tc.name EnvironmentSample_reentrantImport_1746
     * @tc.desc Reenter import at first stat, mask FDFF, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1746", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1746";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/.hidden"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        const expected02: string[] = ["preexisting.txt", "report.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "innerResult", innerResult, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt", "copy:/download/资料.txt->/sandbox/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ", "stat:/inner-download/资料.txt",
          "stat:/inner-download/.hidden", "copy:/inner-download/.hidden->/inner-sandbox/.hidden",
          "stat:/inner-download/report.txt", "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:stat:/inner-download/资料.txt",
          "inner:stat:/inner-download/.hidden", "inner:copy:/inner-download/.hidden->/inner-sandbox/.hidden",
          "inner:stat:/inner-download/report.txt", "inner:list:/inner-sandbox",
          "outer:copy:/download/report.txt->/sandbox/report.txt", "outer:stat:/download/.hidden",
          "outer:stat:/download/资料.txt", "outer:copy:/download/资料.txt->/sandbox/资料.txt",
          "outer:stat:/download/ spaced ", "outer:copy:/download/ spaced ->/sandbox/ spaced ",
          "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected07);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] = ["/inner-download/.hidden->/inner-sandbox/.hidden"];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        const expected10: string[] = ["preexisting.txt", "report.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected10);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected10));
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001748
     * @tc.name EnvironmentSample_reentrantImport_1747
     * @tc.desc Reenter import at first stat, mask FFDD, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1747", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1747";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/ spaced ", "/inner-download/资料.txt"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        logAssertion(caseName, "innerResult", innerResult, ["preexisting.txt", " spaced ", "资料.txt"]);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(["preexisting.txt", " spaced ", "资料.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ",
          "copy:/inner-download/ spaced ->/inner-sandbox/ spaced ", "stat:/inner-download/资料.txt",
          "copy:/inner-download/资料.txt->/inner-sandbox/资料.txt", "stat:/inner-download/.hidden",
          "stat:/inner-download/report.txt", "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:copy:/inner-download/ spaced ->/inner-sandbox/ spaced ",
          "inner:stat:/inner-download/资料.txt", "inner:copy:/inner-download/资料.txt->/inner-sandbox/资料.txt",
          "inner:stat:/inner-download/.hidden", "inner:stat:/inner-download/report.txt",
          "inner:list:/inner-sandbox", "outer:copy:/download/report.txt->/sandbox/report.txt",
          "outer:stat:/download/.hidden", "outer:copy:/download/.hidden->/sandbox/.hidden",
          "outer:stat:/download/资料.txt", "outer:stat:/download/ spaced ", "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden"];
        logAssertion(caseName, "api.copied", api.copied, expected07);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] =
          ["/inner-download/ spaced ->/inner-sandbox/ spaced ", "/inner-download/资料.txt->/inner-sandbox/资料.txt"];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        const expected10: string[] = ["preexisting.txt", "report.txt", ".hidden"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected10);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected10));
        const expected11: string[] = ["preexisting.txt", " spaced ", "资料.txt"];
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, expected11);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(expected11));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001749
     * @tc.name EnvironmentSample_reentrantImport_1748
     * @tc.desc Reenter import at first stat, mask FFDF, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1748", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1748";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/资料.txt"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        const expected02: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "innerResult", innerResult, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ", "stat:/inner-download/资料.txt",
          "copy:/inner-download/资料.txt->/inner-sandbox/资料.txt", "stat:/inner-download/.hidden",
          "stat:/inner-download/report.txt", "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:stat:/inner-download/资料.txt",
          "inner:copy:/inner-download/资料.txt->/inner-sandbox/资料.txt", "inner:stat:/inner-download/.hidden",
          "inner:stat:/inner-download/report.txt", "inner:list:/inner-sandbox",
          "outer:copy:/download/report.txt->/sandbox/report.txt", "outer:stat:/download/.hidden",
          "outer:copy:/download/.hidden->/sandbox/.hidden", "outer:stat:/download/资料.txt",
          "outer:stat:/download/ spaced ", "outer:copy:/download/ spaced ->/sandbox/ spaced ",
          "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected07);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] = ["/inner-download/资料.txt->/inner-sandbox/资料.txt"];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        const expected10: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected10);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected10));
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001750
     * @tc.name EnvironmentSample_reentrantImport_1749
     * @tc.desc Reenter import at first stat, mask FFFD, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1749", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1749";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        inner.regularPaths = ["/inner-download/ spaced "];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        const expected02: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "innerResult", innerResult, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ",
          "copy:/inner-download/ spaced ->/inner-sandbox/ spaced ", "stat:/inner-download/资料.txt",
          "stat:/inner-download/.hidden", "stat:/inner-download/report.txt", "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:copy:/inner-download/ spaced ->/inner-sandbox/ spaced ",
          "inner:stat:/inner-download/资料.txt", "inner:stat:/inner-download/.hidden",
          "inner:stat:/inner-download/report.txt", "inner:list:/inner-sandbox",
          "outer:copy:/download/report.txt->/sandbox/report.txt", "outer:stat:/download/.hidden",
          "outer:copy:/download/.hidden->/sandbox/.hidden", "outer:stat:/download/资料.txt",
          "outer:copy:/download/资料.txt->/sandbox/资料.txt", "outer:stat:/download/ spaced ", "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected07);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] = ["/inner-download/ spaced ->/inner-sandbox/ spaced "];
        logAssertion(caseName, "inner.copied", inner.copied, expected08);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify(expected08));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        const expected10: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected10);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected10));
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001751
     * @tc.name EnvironmentSample_reentrantImport_1750
     * @tc.desc Reenter import at first stat, mask FFFF, reversed inner names and complementary files; preserve
     * nested order, distinct paths and independent result ownership.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantImport_1750", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantImport_1750";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        const inner: DownloadMatrixProbe = new DownloadMatrixProbe();
        inner.downloadPath = "/inner-download";
        inner.sandboxPath = "/inner-sandbox";
        inner.entries = [" spaced ", "资料.txt", ".hidden", "report.txt"];
        let nested: boolean = false;
        let innerResult: string[] = [];
        const timeline: string[] = [];
        api.hook = (event: string): void => {
          timeline.push("outer:" + event);
          if (event === 'stat:/download/report.txt' && !nested) {
            nested = true;
            innerResult = importDownloadFiles("/inner-download", "/inner-sandbox", inner);
          }
        };
        inner.hook = (event: string): void => {
          timeline.push("inner:" + event);
        };
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "nested", nested, true);
        expect(nested).assertEqual(true);
        const expected02: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "innerResult", innerResult, ["preexisting.txt"]);
        expect(JSON.stringify(innerResult)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/inner-download", "stat:/inner-download/ spaced ", "stat:/inner-download/资料.txt",
          "stat:/inner-download/.hidden", "stat:/inner-download/report.txt", "list:/inner-sandbox",
        ];
        logAssertion(caseName, "inner.events", inner.events, expected05);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = [
          "outer:list:/download", "outer:stat:/download/report.txt", "inner:list:/inner-download",
          "inner:stat:/inner-download/ spaced ", "inner:stat:/inner-download/资料.txt",
          "inner:stat:/inner-download/.hidden", "inner:stat:/inner-download/report.txt",
          "inner:list:/inner-sandbox", "outer:copy:/download/report.txt->/sandbox/report.txt",
          "outer:stat:/download/.hidden", "outer:copy:/download/.hidden->/sandbox/.hidden",
          "outer:stat:/download/资料.txt", "outer:copy:/download/资料.txt->/sandbox/资料.txt",
          "outer:stat:/download/ spaced ", "outer:copy:/download/ spaced ->/sandbox/ spaced ",
          "outer:list:/sandbox",
        ];
        logAssertion(caseName, "timeline", timeline, expected06);
        expect(JSON.stringify(timeline)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected07);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.copied", inner.copied, []);
        expect(JSON.stringify(inner.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "result === innerResult", result === innerResult, false);
        expect(result === innerResult).assertEqual(false);
        result.push('outer-caller');
        innerResult.push('inner-caller');
        const expected10: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected10);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected10));
        logAssertion(caseName, "inner.sandboxEntries", inner.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(inner.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001752
     * @tc.name EnvironmentSample_scheduledIndependent_1751
     * @tc.desc Schedule a/b imports, mask DD, dispatch AB, first stat failure False; verify dispatch, fixed
     * results, error identity and API isolation.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_scheduledIndependent_1751", 0, async (): Promise<void> => {
      const caseName: string = "EnvironmentSample_scheduledIndependent_1751";
      logCase(caseName, 'begin');
      try {
        const first: DownloadMatrixProbe = new DownloadMatrixProbe();
        first.downloadPath = "/a-download";
        first.sandboxPath = "/a-sandbox";
        first.entries = ["a.txt"];
        const second: DownloadMatrixProbe = new DownloadMatrixProbe();
        second.downloadPath = "/b-download";
        second.sandboxPath = "/b-sandbox";
        second.entries = ["b.txt"];
        const order: string[] = [];
        let firstError: Error | undefined = undefined;
        const runFirst: () => string[] = (): string[] => {
          order.push("first");
          try {
            return importDownloadFiles("/a-download", "/a-sandbox", first);
          } catch (error) {
            firstError = error as Error;
            return [];
          }
        };
        const runSecond: () => string[] = (): string[] => {
          order.push("second");
          return importDownloadFiles("/b-download", "/b-sandbox", second);
        };
        const pending: Promise<string[]>[] = [];
        pending.push(Promise.resolve().then(runFirst));
        pending.push(Promise.resolve().then(runSecond));
        const results: string[][] = await Promise.all(pending);
        logAssertion(caseName, "order", order, ["first", "second"]);
        expect(JSON.stringify(order)).assertEqual(JSON.stringify(["first", "second"]));
        logAssertion(caseName, "results", results, [["preexisting.txt"], ["preexisting.txt"]]);
        expect(JSON.stringify(results)).assertEqual(JSON.stringify([["preexisting.txt"], ["preexisting.txt"]]));
        logAssertion(caseName, "firstError === undefined", firstError === undefined, true);
        expect(firstError === undefined).assertEqual(true);
        const expected04: string[] = ["list:/a-download", "stat:/a-download/a.txt", "list:/a-sandbox"];
        logAssertion(caseName, "first.events", first.events, expected04);
        expect(JSON.stringify(first.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["list:/b-download", "stat:/b-download/b.txt", "list:/b-sandbox"];
        logAssertion(caseName, "second.events", second.events, expected05);
        expect(JSON.stringify(second.events)).assertEqual(JSON.stringify(expected05));
        logAssertion(caseName, "first.copied", first.copied, []);
        expect(JSON.stringify(first.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "second.copied", second.copied, []);
        expect(JSON.stringify(second.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "first.sandboxEntries", first.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(first.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "second.sandboxEntries", second.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(second.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "results[0] === results[1]", results[0] === results[1], false);
        expect(results[0] === results[1]).assertEqual(false);
      } finally {
        logCase(caseName, 'end');
      }
    });
  });
}
