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

export default function downloadMatrix069Test(): void {
  describe('DownloadMatrix069', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001633
     * @tc.name EnvironmentSample_writer_37_both_1632
     * @tc.desc Write empty payload, descriptor 37, mode both; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_both_1632", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_both_1632";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        const writeError: Error = new Error("write failed");
        const closeError: Error = new Error("close failed");
        api.writeFailure = writeError;
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
        api.writeFailure = undefined;
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
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001634
     * @tc.name EnvironmentSample_writer_37_success_1633
     * @tc.desc Write plain payload, descriptor 37, mode success; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_success_1633", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_success_1633";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "plain text", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:37:plain text", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:plain text", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001635
     * @tc.name EnvironmentSample_writer_37_write_1634
     * @tc.desc Write plain payload, descriptor 37, mode write; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_write_1634", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_write_1634";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        const writeError: Error = new Error("write failed");
        api.writeFailure = writeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "plain text", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === writeError", caught === writeError, true);
        expect(caught === writeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:37:plain text", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:plain text", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001636
     * @tc.name EnvironmentSample_writer_37_close_1635
     * @tc.desc Write plain payload, descriptor 37, mode close; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_close_1635", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_close_1635";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        const closeError: Error = new Error("close failed");
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "plain text", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:37:plain text", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:plain text", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001637
     * @tc.name EnvironmentSample_writer_37_both_1636
     * @tc.desc Write plain payload, descriptor 37, mode both; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_both_1636", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_both_1636";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:plain text", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:plain text", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001638
     * @tc.name EnvironmentSample_writer_37_success_1637
     * @tc.desc Write NUL payload, descriptor 37, mode success; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_success_1637", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_success_1637";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "\u0000", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:37:\u0000", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:\u0000", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001639
     * @tc.name EnvironmentSample_writer_37_write_1638
     * @tc.desc Write NUL payload, descriptor 37, mode write; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_write_1638", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_write_1638";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:\u0000", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:\u0000", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001640
     * @tc.name EnvironmentSample_writer_37_close_1639
     * @tc.desc Write NUL payload, descriptor 37, mode close; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_close_1639", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_close_1639";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:\u0000", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:\u0000", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001641
     * @tc.name EnvironmentSample_writer_37_both_1640
     * @tc.desc Write NUL payload, descriptor 37, mode both; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_both_1640", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_both_1640";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:\u0000", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:\u0000", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001642
     * @tc.name EnvironmentSample_writer_37_success_1641
     * @tc.desc Write multiline payload, descriptor 37, mode success; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_success_1641", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_success_1641";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "line1\nline2", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:37:line1\nline2", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:line1\nline2", "close:37", "open:/download/temp.txt",
          "write:37:retry", "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001643
     * @tc.name EnvironmentSample_writer_37_write_1642
     * @tc.desc Write multiline payload, descriptor 37, mode write; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_write_1642", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_write_1642";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:line1\nline2", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:line1\nline2", "close:37", "open:/download/temp.txt",
          "write:37:retry", "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001644
     * @tc.name EnvironmentSample_writer_37_close_1643
     * @tc.desc Write multiline payload, descriptor 37, mode close; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_close_1643", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_close_1643";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:line1\nline2", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:line1\nline2", "close:37", "open:/download/temp.txt",
          "write:37:retry", "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001645
     * @tc.name EnvironmentSample_writer_37_both_1644
     * @tc.desc Write multiline payload, descriptor 37, mode both; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_both_1644", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_both_1644";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:line1\nline2", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:line1\nline2", "close:37", "open:/download/temp.txt",
          "write:37:retry", "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001646
     * @tc.name EnvironmentSample_writer_37_success_1645
     * @tc.desc Write Unicode-text payload, descriptor 37, mode success; open/write/finally-close once, preserve
     * last error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_success_1645", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_success_1645";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "中文内容", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:37:中文内容", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:中文内容", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001647
     * @tc.name EnvironmentSample_writer_37_write_1646
     * @tc.desc Write Unicode-text payload, descriptor 37, mode write; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_write_1646", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_write_1646";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:中文内容", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:中文内容", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001648
     * @tc.name EnvironmentSample_writer_37_close_1647
     * @tc.desc Write Unicode-text payload, descriptor 37, mode close; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_close_1647", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_close_1647";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:中文内容", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:中文内容", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001649
     * @tc.name EnvironmentSample_writer_37_both_1648
     * @tc.desc Write Unicode-text payload, descriptor 37, mode both; open/write/finally-close once, preserve last
     * error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_both_1648", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_both_1648";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:中文内容", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:中文内容", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001650
     * @tc.name EnvironmentSample_writer_37_success_1649
     * @tc.desc Write emoji payload, descriptor 37, mode success; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_success_1649", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_success_1649";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "😀", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:37:😀", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:😀", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001651
     * @tc.name EnvironmentSample_writer_37_write_1650
     * @tc.desc Write emoji payload, descriptor 37, mode write; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_write_1650", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_write_1650";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:😀", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:😀", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001652
     * @tc.name EnvironmentSample_writer_37_close_1651
     * @tc.desc Write emoji payload, descriptor 37, mode close; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_close_1651", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_close_1651";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:😀", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:😀", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001653
     * @tc.name EnvironmentSample_writer_37_both_1652
     * @tc.desc Write emoji payload, descriptor 37, mode both; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_both_1652", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_both_1652";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:😀", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:😀", "close:37", "open:/download/temp.txt", "write:37:retry",
          "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001654
     * @tc.name EnvironmentSample_writer_37_success_1653
     * @tc.desc Write trailing-spaces payload, descriptor 37, mode success; open/write/finally-close once, preserve
     * last error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_success_1653", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_success_1653";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "trailing spaces  ", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:37:trailing spaces  ", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:trailing spaces  ", "close:37", "open:/download/temp.txt",
          "write:37:retry", "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001655
     * @tc.name EnvironmentSample_writer_37_write_1654
     * @tc.desc Write trailing-spaces payload, descriptor 37, mode write; open/write/finally-close once, preserve
     * last error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_write_1654", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_write_1654";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:trailing spaces  ", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:trailing spaces  ", "close:37", "open:/download/temp.txt",
          "write:37:retry", "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001656
     * @tc.name EnvironmentSample_writer_37_close_1655
     * @tc.desc Write trailing-spaces payload, descriptor 37, mode close; open/write/finally-close once, preserve
     * last error identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_37_close_1655", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_37_close_1655";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
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
        const expected02: string[] = ["open:/download/temp.txt", "write:37:trailing spaces  ", "close:37"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:37:trailing spaces  ", "close:37", "open:/download/temp.txt",
          "write:37:retry", "close:37",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
  });
}
