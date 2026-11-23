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
import { writeDownloadMessage } from '../../../main/ets/model/DownloadFiles';
import { DownloadMatrixProbe } from './DownloadMatrixProbe';
import { logCase, logAssertion } from './EnvironmentTestSupport';

export default function downloadMatrix068Test(): void {
  describe('DownloadMatrix068', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001609
     * @tc.name EnvironmentSample_writer_0_both_1608
     * @tc.desc Write plain payload, descriptor 0, mode both; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_both_1608", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_both_1608";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const writeError: Error = new Error("write failed");
        const closeError: Error = new Error("close failed");
        api.writeFailure = writeError;
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "plain text", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:plain text", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:plain text", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001610
     * @tc.name EnvironmentSample_writer_0_success_1609
     * @tc.desc Write NUL payload, descriptor 0, mode success; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_success_1609", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_success_1609";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "\u0000", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:\u0000", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:\u0000", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001611
     * @tc.name EnvironmentSample_writer_0_write_1610
     * @tc.desc Write NUL payload, descriptor 0, mode write; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_write_1610", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_write_1610";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const writeError: Error = new Error("write failed");
        api.writeFailure = writeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "\u0000", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === writeError", caught === writeError, true);
        expect(caught === writeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:\u0000", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:\u0000", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001612
     * @tc.name EnvironmentSample_writer_0_close_1611
     * @tc.desc Write NUL payload, descriptor 0, mode close; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_close_1611", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_close_1611";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const closeError: Error = new Error("close failed");
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "\u0000", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:\u0000", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:\u0000", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001613
     * @tc.name EnvironmentSample_writer_0_both_1612
     * @tc.desc Write NUL payload, descriptor 0, mode both; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_both_1612", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_both_1612";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const writeError: Error = new Error("write failed");
        const closeError: Error = new Error("close failed");
        api.writeFailure = writeError;
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "\u0000", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:\u0000", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:\u0000", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001614
     * @tc.name EnvironmentSample_writer_0_success_1613
     * @tc.desc Write multiline payload, descriptor 0, mode success; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_success_1613", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_success_1613";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "line1\nline2", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:line1\nline2", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:line1\nline2", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001615
     * @tc.name EnvironmentSample_writer_0_write_1614
     * @tc.desc Write multiline payload, descriptor 0, mode write; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_write_1614", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_write_1614";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const writeError: Error = new Error("write failed");
        api.writeFailure = writeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "line1\nline2", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === writeError", caught === writeError, true);
        expect(caught === writeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:line1\nline2", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:line1\nline2", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001616
     * @tc.name EnvironmentSample_writer_0_close_1615
     * @tc.desc Write multiline payload, descriptor 0, mode close; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_close_1615", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_close_1615";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const closeError: Error = new Error("close failed");
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "line1\nline2", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:line1\nline2", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:line1\nline2", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001617
     * @tc.name EnvironmentSample_writer_0_both_1616
     * @tc.desc Write multiline payload, descriptor 0, mode both; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_both_1616", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_both_1616";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const writeError: Error = new Error("write failed");
        const closeError: Error = new Error("close failed");
        api.writeFailure = writeError;
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "line1\nline2", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:line1\nline2", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:line1\nline2", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001618
     * @tc.name EnvironmentSample_writer_0_success_1617
     * @tc.desc Write Unicode-text payload, descriptor 0, mode success; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_success_1617", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_success_1617";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "中文内容", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:中文内容", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:中文内容", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001619
     * @tc.name EnvironmentSample_writer_0_write_1618
     * @tc.desc Write Unicode-text payload, descriptor 0, mode write; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_write_1618", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_write_1618";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const writeError: Error = new Error("write failed");
        api.writeFailure = writeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "中文内容", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === writeError", caught === writeError, true);
        expect(caught === writeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:中文内容", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:中文内容", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001620
     * @tc.name EnvironmentSample_writer_0_close_1619
     * @tc.desc Write Unicode-text payload, descriptor 0, mode close; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_close_1619", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_close_1619";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const closeError: Error = new Error("close failed");
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "中文内容", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:中文内容", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:中文内容", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001621
     * @tc.name EnvironmentSample_writer_0_both_1620
     * @tc.desc Write Unicode-text payload, descriptor 0, mode both; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_both_1620", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_both_1620";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const writeError: Error = new Error("write failed");
        const closeError: Error = new Error("close failed");
        api.writeFailure = writeError;
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "中文内容", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:中文内容", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:中文内容", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001622
     * @tc.name EnvironmentSample_writer_0_success_1621
     * @tc.desc Write emoji payload, descriptor 0, mode success; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_success_1621", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_success_1621";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "😀", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:😀", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] =
          ["open:/download/temp.txt", "write:0:😀", "close:0", "open:/download/temp.txt", "write:0:retry", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001623
     * @tc.name EnvironmentSample_writer_0_write_1622
     * @tc.desc Write emoji payload, descriptor 0, mode write; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_write_1622", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_write_1622";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const writeError: Error = new Error("write failed");
        api.writeFailure = writeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "😀", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === writeError", caught === writeError, true);
        expect(caught === writeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:😀", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] =
          ["open:/download/temp.txt", "write:0:😀", "close:0", "open:/download/temp.txt", "write:0:retry", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001624
     * @tc.name EnvironmentSample_writer_0_close_1623
     * @tc.desc Write emoji payload, descriptor 0, mode close; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_close_1623", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_close_1623";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const closeError: Error = new Error("close failed");
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "😀", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:😀", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] =
          ["open:/download/temp.txt", "write:0:😀", "close:0", "open:/download/temp.txt", "write:0:retry", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001625
     * @tc.name EnvironmentSample_writer_0_both_1624
     * @tc.desc Write emoji payload, descriptor 0, mode both; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_both_1624", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_both_1624";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
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
        const expected02: string[] = ["open:/download/temp.txt", "write:0:😀", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] =
          ["open:/download/temp.txt", "write:0:😀", "close:0", "open:/download/temp.txt", "write:0:retry", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001626
     * @tc.name EnvironmentSample_writer_0_success_1625
     * @tc.desc Write trailing-spaces payload, descriptor 0, mode success; open/write/finally-close once, preserve
     * last error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_success_1625", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_success_1625";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "trailing spaces  ", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:trailing spaces  ", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:trailing spaces  ", "close:0", "open:/download/temp.txt",
          "write:0:retry", "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001627
     * @tc.name EnvironmentSample_writer_0_write_1626
     * @tc.desc Write trailing-spaces payload, descriptor 0, mode write; open/write/finally-close once, preserve
     * last error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_write_1626", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_write_1626";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
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
        const expected02: string[] = ["open:/download/temp.txt", "write:0:trailing spaces  ", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:trailing spaces  ", "close:0", "open:/download/temp.txt",
          "write:0:retry", "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001628
     * @tc.name EnvironmentSample_writer_0_close_1627
     * @tc.desc Write trailing-spaces payload, descriptor 0, mode close; open/write/finally-close once, preserve
     * last error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_close_1627", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_close_1627";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
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
        const expected02: string[] = ["open:/download/temp.txt", "write:0:trailing spaces  ", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:trailing spaces  ", "close:0", "open:/download/temp.txt",
          "write:0:retry", "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001629
     * @tc.name EnvironmentSample_writer_0_both_1628
     * @tc.desc Write trailing-spaces payload, descriptor 0, mode both; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_both_1628", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_both_1628";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
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
        const expected02: string[] = ["open:/download/temp.txt", "write:0:trailing spaces  ", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:trailing spaces  ", "close:0", "open:/download/temp.txt",
          "write:0:retry", "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001630
     * @tc.name EnvironmentSample_writer_37_success_1629
     * @tc.desc Write empty payload, descriptor 37, mode success; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_success_1629", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_success_1629";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:37:", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001631
     * @tc.name EnvironmentSample_writer_37_write_1630
     * @tc.desc Write empty payload, descriptor 37, mode write; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_write_1630", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_write_1630";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        const writeError: Error = new Error("write failed");
        api.writeFailure = writeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === writeError", caught === writeError, true);
        expect(caught === writeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:37:", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001632
     * @tc.name EnvironmentSample_writer_37_close_1631
     * @tc.desc Write empty payload, descriptor 37, mode close; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_close_1631", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_close_1631";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        const closeError: Error = new Error("close failed");
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:37:", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
  });
}
