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

export default function downloadMatrix071Test(): void {
  describe('DownloadMatrix071', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001681
     * @tc.name EnvironmentSample_writer_-1_both_1680
     * @tc.desc Write emoji payload, descriptor -1, mode both; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_-1_both_1680", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_-1_both_1680";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = -1;
        const writeError: Error = new Error("write failed");
        const closeError: Error = new Error("close failed");
        api.writeFailure = writeError;
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "😀", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:-1:😀", "close:-1"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:-1:😀", "close:-1", "open:/download/temp.txt", "write:-1:retry",
          "close:-1",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001682
     * @tc.name EnvironmentSample_writer_-1_success_1681
     * @tc.desc Write trailing-spaces payload, descriptor -1, mode success; open/write/finally-close once, preserve
     * last error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_-1_success_1681", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_-1_success_1681";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = -1;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "trailing spaces  ", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:-1:trailing spaces  ", "close:-1"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:-1:trailing spaces  ", "close:-1", "open:/download/temp.txt",
          "write:-1:retry", "close:-1",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001683
     * @tc.name EnvironmentSample_writer_-1_write_1682
     * @tc.desc Write trailing-spaces payload, descriptor -1, mode write; open/write/finally-close once, preserve
     * last error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_-1_write_1682", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_-1_write_1682";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = -1;
        const writeError: Error = new Error("write failed");
        api.writeFailure = writeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "trailing spaces  ", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === writeError", caught === writeError, true);
        expect(caught === writeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:-1:trailing spaces  ", "close:-1"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:-1:trailing spaces  ", "close:-1", "open:/download/temp.txt",
          "write:-1:retry", "close:-1",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001684
     * @tc.name EnvironmentSample_writer_-1_close_1683
     * @tc.desc Write trailing-spaces payload, descriptor -1, mode close; open/write/finally-close once, preserve
     * last error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_-1_close_1683", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_-1_close_1683";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = -1;
        const closeError: Error = new Error("close failed");
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "trailing spaces  ", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:-1:trailing spaces  ", "close:-1"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:-1:trailing spaces  ", "close:-1", "open:/download/temp.txt",
          "write:-1:retry", "close:-1",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001685
     * @tc.name EnvironmentSample_writer_-1_both_1684
     * @tc.desc Write trailing-spaces payload, descriptor -1, mode both; open/write/finally-close once, preserve
     * last error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_-1_both_1684", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_-1_both_1684";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = -1;
        const writeError: Error = new Error("write failed");
        const closeError: Error = new Error("close failed");
        api.writeFailure = writeError;
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "trailing spaces  ", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:-1:trailing spaces  ", "close:-1"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:-1:trailing spaces  ", "close:-1", "open:/download/temp.txt",
          "write:-1:retry", "close:-1",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001686
     * @tc.name EnvironmentSample_writer_open
     * @tc.desc Fail open with identical injected error; do not write or close.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_open", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_open";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        const injected: Error = api.failure;
        let caught: Error | undefined = undefined;
        api.faultEvent = 'open:/download/temp.txt';
        try {
          writeDownloadMessage("/download", "not written", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "api.events", api.events, ["open:/download/temp.txt"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["open:/download/temp.txt"]));
        logAssertion(caseName, "api.opened", api.opened, ["/download/temp.txt"]);
        expect(JSON.stringify(api.opened)).assertEqual(JSON.stringify(["/download/temp.txt"]));
        logAssertion(caseName, "api.written", api.written, []);
        expect(JSON.stringify(api.written)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.closed", api.closed, []);
        expect(JSON.stringify(api.closed)).assertEqual(JSON.stringify([]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001687
     * @tc.name EnvironmentSample_writer_emptyRoot
     * @tc.desc Reject empty write directory with the fixed validation error before open/write/close.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_emptyRoot", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_emptyRoot";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("", "not written", api);
        } catch (error) {
          caught = error as Error;
        }
        const message: string = caught === undefined ? "" : caught.message;
        logAssertion(caseName, "message", message, "Invalid download write directory");
        expect(message).assertEqual("Invalid download write directory");
        logAssertion(caseName, "api.events", api.events, []);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.opened", api.opened, []);
        expect(JSON.stringify(api.opened)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.written", api.written, []);
        expect(JSON.stringify(api.written)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.closed", api.closed, []);
        expect(JSON.stringify(api.closed)).assertEqual(JSON.stringify([]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001688
     * @tc.name EnvironmentSample_reentrantWriter_success_1687
     * @tc.desc Reenter writer at first stat, outer mask DDDD, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1687", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1687";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
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
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001689
     * @tc.name EnvironmentSample_reentrantWriter_write_1688
     * @tc.desc Reenter writer at first stat, outer mask DDDD, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1688", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1688";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
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
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001690
     * @tc.name EnvironmentSample_reentrantWriter_close_1689
     * @tc.desc Reenter writer at first stat, outer mask DDDD, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1689", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1689";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
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
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001691
     * @tc.name EnvironmentSample_reentrantWriter_success_1690
     * @tc.desc Reenter writer at first stat, outer mask DDDF, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1690", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1690";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/ spaced "];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, ["/download/ spaced ->/sandbox/ spaced "]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/ spaced ->/sandbox/ spaced "]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001692
     * @tc.name EnvironmentSample_reentrantWriter_write_1691
     * @tc.desc Reenter writer at first stat, outer mask DDDF, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1691", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1691";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/ spaced "];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, ["/download/ spaced ->/sandbox/ spaced "]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/ spaced ->/sandbox/ spaced "]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001693
     * @tc.name EnvironmentSample_reentrantWriter_close_1692
     * @tc.desc Reenter writer at first stat, outer mask DDDF, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1692", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1692";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/ spaced "];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, ["/download/ spaced ->/sandbox/ spaced "]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/ spaced ->/sandbox/ spaced "]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " spaced "]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " spaced "]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001694
     * @tc.name EnvironmentSample_reentrantWriter_success_1693
     * @tc.desc Reenter writer at first stat, outer mask DDFD, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1693", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1693";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt"];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, ["/download/资料.txt->/sandbox/资料.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/资料.txt->/sandbox/资料.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001695
     * @tc.name EnvironmentSample_reentrantWriter_write_1694
     * @tc.desc Reenter writer at first stat, outer mask DDFD, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1694", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1694";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt"];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, ["/download/资料.txt->/sandbox/资料.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/资料.txt->/sandbox/资料.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001696
     * @tc.name EnvironmentSample_reentrantWriter_close_1695
     * @tc.desc Reenter writer at first stat, outer mask DDFD, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1695", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1695";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt"];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, ["/download/资料.txt->/sandbox/资料.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/资料.txt->/sandbox/资料.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "资料.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001697
     * @tc.name EnvironmentSample_reentrantWriter_success_1696
     * @tc.desc Reenter writer at first stat, outer mask DDFF, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1696", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1696";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt", "/download/ spaced "];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", "资料.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt", " spaced "]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001698
     * @tc.name EnvironmentSample_reentrantWriter_write_1697
     * @tc.desc Reenter writer at first stat, outer mask DDFF, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1697", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1697";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt", "/download/ spaced "];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", "资料.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt", " spaced "]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001699
     * @tc.name EnvironmentSample_reentrantWriter_close_1698
     * @tc.desc Reenter writer at first stat, outer mask DDFF, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1698", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1698";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt", "/download/ spaced "];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", "资料.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "资料.txt", " spaced "]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected05);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected05));
        const expected06: string[] = ["preexisting.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        const expected09: string[] = ["preexisting.txt", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected09);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected09));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001700
     * @tc.name EnvironmentSample_reentrantWriter_success_1699
     * @tc.desc Reenter writer at first stat, outer mask DFDD, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1699", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1699";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, ["/download/.hidden->/sandbox/.hidden"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/.hidden->/sandbox/.hidden"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001701
     * @tc.name EnvironmentSample_reentrantWriter_write_1700
     * @tc.desc Reenter writer at first stat, outer mask DFDD, inner mode write, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_write_1700", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_write_1700";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, ["/download/.hidden->/sandbox/.hidden"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/.hidden->/sandbox/.hidden"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001702
     * @tc.name EnvironmentSample_reentrantWriter_close_1701
     * @tc.desc Reenter writer at first stat, outer mask DFDD, inner mode close, descriptor 0; isolate inner errors,
     * close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_close_1701", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_close_1701";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected04);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "api.copied", api.copied, ["/download/.hidden->/sandbox/.hidden"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/.hidden->/sandbox/.hidden"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        const expected07: string[] = ["open:/inner/temp.txt", "write:0:nested", "close:0"];
        logAssertion(caseName, "inner.events", inner.events, expected07);
        expect(JSON.stringify(inner.events)).assertEqual(JSON.stringify(expected07));
        logAssertion(caseName, "inner.closed", inner.closed, [0]);
        expect(JSON.stringify(inner.closed)).assertEqual(JSON.stringify([0]));
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001703
     * @tc.name EnvironmentSample_reentrantWriter_success_1702
     * @tc.desc Reenter writer at first stat, outer mask DFDF, inner mode success, descriptor 0; isolate inner
     * errors, close once and finish outer import.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_reentrantWriter_success_1702", 0, (): void => {
      const caseName: string = "EnvironmentSample_reentrantWriter_success_1702";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
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
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", " spaced "]));
        const expected04: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
