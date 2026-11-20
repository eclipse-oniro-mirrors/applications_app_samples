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
