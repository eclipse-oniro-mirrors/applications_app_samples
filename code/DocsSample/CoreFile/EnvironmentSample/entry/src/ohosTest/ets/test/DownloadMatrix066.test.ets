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
import { importDownloadFiles } from '../../../main/ets/model/DownloadFiles';
import { DownloadMatrixProbe } from './DownloadMatrixProbe';
import { logCase, logAssertion } from './EnvironmentTestSupport';

export default function downloadMatrix066Test(): void {
  describe('DownloadMatrix066', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001561
     * @tc.name EnvironmentSample_wholeList_nul_3_1560
     * @tc.desc Reject nul name at index 3, prefix DFF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_3_1560", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_3_1560";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "before\u0000after"];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/before\u0000after"];
        const sourceAlias: string[] = api.entries;
        let message: string = "";
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          message = (error as Error).message;
        }
        logAssertion(caseName, "message", message, "Invalid download entry");
        expect(message).assertEqual("Invalid download entry");
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.events", api.events, ["list:/download"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        sourceAlias.splice(0, sourceAlias.length, 'repaired.txt');
        api.regularPaths = ['/download/repaired.txt'];
        const repaired: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "repaired", repaired, ["preexisting.txt", "repaired.txt"]);
        expect(JSON.stringify(repaired)).assertEqual(JSON.stringify(["preexisting.txt", "repaired.txt"]));
        const expected07: string[] = [
          "list:/download", "list:/download", "stat:/download/repaired.txt",
          "copy:/download/repaired.txt->/sandbox/repaired.txt", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected07);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] = ["/download/repaired.txt->/sandbox/repaired.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected08);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected08));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001562
     * @tc.name EnvironmentSample_wholeList_nul_3_1561
     * @tc.desc Reject nul name at index 3, prefix FDD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_3_1561", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_3_1561";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "before\u0000after"];
        api.regularPaths = ["/download/report.txt", "/download/before\u0000after"];
        const sourceAlias: string[] = api.entries;
        let message: string = "";
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          message = (error as Error).message;
        }
        logAssertion(caseName, "message", message, "Invalid download entry");
        expect(message).assertEqual("Invalid download entry");
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.events", api.events, ["list:/download"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        sourceAlias.splice(0, sourceAlias.length, 'repaired.txt');
        api.regularPaths = ['/download/repaired.txt'];
        const repaired: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "repaired", repaired, ["preexisting.txt", "repaired.txt"]);
        expect(JSON.stringify(repaired)).assertEqual(JSON.stringify(["preexisting.txt", "repaired.txt"]));
        const expected07: string[] = [
          "list:/download", "list:/download", "stat:/download/repaired.txt",
          "copy:/download/repaired.txt->/sandbox/repaired.txt", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected07);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] = ["/download/repaired.txt->/sandbox/repaired.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected08);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected08));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001563
     * @tc.name EnvironmentSample_wholeList_nul_3_1562
     * @tc.desc Reject nul name at index 3, prefix FDF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_3_1562", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_3_1562";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "before\u0000after"];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt", "/download/before\u0000after"];
        const sourceAlias: string[] = api.entries;
        let message: string = "";
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          message = (error as Error).message;
        }
        logAssertion(caseName, "message", message, "Invalid download entry");
        expect(message).assertEqual("Invalid download entry");
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.events", api.events, ["list:/download"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        sourceAlias.splice(0, sourceAlias.length, 'repaired.txt');
        api.regularPaths = ['/download/repaired.txt'];
        const repaired: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "repaired", repaired, ["preexisting.txt", "repaired.txt"]);
        expect(JSON.stringify(repaired)).assertEqual(JSON.stringify(["preexisting.txt", "repaired.txt"]));
        const expected07: string[] = [
          "list:/download", "list:/download", "stat:/download/repaired.txt",
          "copy:/download/repaired.txt->/sandbox/repaired.txt", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected07);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] = ["/download/repaired.txt->/sandbox/repaired.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected08);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected08));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001564
     * @tc.name EnvironmentSample_wholeList_nul_3_1563
     * @tc.desc Reject nul name at index 3, prefix FFD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_3_1563", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_3_1563";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "before\u0000after"];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/before\u0000after"];
        const sourceAlias: string[] = api.entries;
        let message: string = "";
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          message = (error as Error).message;
        }
        logAssertion(caseName, "message", message, "Invalid download entry");
        expect(message).assertEqual("Invalid download entry");
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.events", api.events, ["list:/download"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        sourceAlias.splice(0, sourceAlias.length, 'repaired.txt');
        api.regularPaths = ['/download/repaired.txt'];
        const repaired: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "repaired", repaired, ["preexisting.txt", "repaired.txt"]);
        expect(JSON.stringify(repaired)).assertEqual(JSON.stringify(["preexisting.txt", "repaired.txt"]));
        const expected07: string[] = [
          "list:/download", "list:/download", "stat:/download/repaired.txt",
          "copy:/download/repaired.txt->/sandbox/repaired.txt", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected07);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] = ["/download/repaired.txt->/sandbox/repaired.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected08);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected08));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001565
     * @tc.name EnvironmentSample_wholeList_nul_3_1564
     * @tc.desc Reject nul name at index 3, prefix FFF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_3_1564", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_3_1564";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "before\u0000after"];
        api.regularPaths =
          ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/before\u0000after"];
        const sourceAlias: string[] = api.entries;
        let message: string = "";
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          message = (error as Error).message;
        }
        logAssertion(caseName, "message", message, "Invalid download entry");
        expect(message).assertEqual("Invalid download entry");
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.events", api.events, ["list:/download"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        sourceAlias.splice(0, sourceAlias.length, 'repaired.txt');
        api.regularPaths = ['/download/repaired.txt'];
        const repaired: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "repaired", repaired, ["preexisting.txt", "repaired.txt"]);
        expect(JSON.stringify(repaired)).assertEqual(JSON.stringify(["preexisting.txt", "repaired.txt"]));
        const expected07: string[] = [
          "list:/download", "list:/download", "stat:/download/repaired.txt",
          "copy:/download/repaired.txt->/sandbox/repaired.txt", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected07);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected07));
        const expected08: string[] = ["/download/repaired.txt->/sandbox/repaired.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected08);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected08));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001566
     * @tc.name EnvironmentSample_directories_emptySource
     * @tc.desc Reject emptySource directory boundary with the fixed validation error before all file API calls.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_directories_emptySource", 0, (): void => {
      const caseName: string = "EnvironmentSample_directories_emptySource";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        let message: string = "";
        try {
          importDownloadFiles("", "/sandbox", api);
        } catch (error) {
          message = (error as Error).message;
        }
        logAssertion(caseName, "message", message, "Invalid download import directories");
        expect(message).assertEqual("Invalid download import directories");
        logAssertion(caseName, "api.events", api.events, []);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001567
     * @tc.name EnvironmentSample_directories_emptySandbox
     * @tc.desc Reject emptySandbox directory boundary with the fixed validation error before all file API calls.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_directories_emptySandbox", 0, (): void => {
      const caseName: string = "EnvironmentSample_directories_emptySandbox";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        let message: string = "";
        try {
          importDownloadFiles("/download", "", api);
        } catch (error) {
          message = (error as Error).message;
        }
        logAssertion(caseName, "message", message, "Invalid download import directories");
        expect(message).assertEqual("Invalid download import directories");
        logAssertion(caseName, "api.events", api.events, []);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001568
     * @tc.name EnvironmentSample_directories_sameRoot
     * @tc.desc Reject sameRoot directory boundary with the fixed validation error before all file API calls.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_directories_sameRoot", 0, (): void => {
      const caseName: string = "EnvironmentSample_directories_sameRoot";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        let message: string = "";
        try {
          importDownloadFiles("/download", "/download", api);
        } catch (error) {
          message = (error as Error).message;
        }
        logAssertion(caseName, "message", message, "Invalid download import directories");
        expect(message).assertEqual("Invalid download import directories");
        logAssertion(caseName, "api.events", api.events, []);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001569
     * @tc.name EnvironmentSample_acceptedBoundary_1568
     * @tc.desc Accept empty-list boundaries, mask empty; stat in order, copy only files, list sandbox last and
     * isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1568", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1568";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "api.events", api.events, ["list:/download", "list:/sandbox"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download", "list:/sandbox"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001570
     * @tc.name EnvironmentSample_acceptedBoundary_1569
     * @tc.desc Accept embedded-dots/punctuation/newline boundaries, mask DDD; stat in order, copy only files, list
     * sandbox last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1569", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1569";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["a..b", "semi;colon.txt", "line\nbreak"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/a..b", "stat:/download/semi;colon.txt", "stat:/download/line\nbreak",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001571
     * @tc.name EnvironmentSample_acceptedBoundary_1570
     * @tc.desc Accept embedded-dots/punctuation/newline boundaries, mask DDF; stat in order, copy only files, list
     * sandbox last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1570", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1570";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["a..b", "semi;colon.txt", "line\nbreak"];
        api.regularPaths = ["/download/line\nbreak"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "line\nbreak"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "line\nbreak"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/a..b", "stat:/download/semi;colon.txt", "stat:/download/line\nbreak",
          "copy:/download/line\nbreak->/sandbox/line\nbreak", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, ["/download/line\nbreak->/sandbox/line\nbreak"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/line\nbreak->/sandbox/line\nbreak"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "line\nbreak"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "line\nbreak"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "line\nbreak"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "line\nbreak"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001572
     * @tc.name EnvironmentSample_acceptedBoundary_1571
     * @tc.desc Accept embedded-dots/punctuation/newline boundaries, mask DFD; stat in order, copy only files, list
     * sandbox last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1571", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1571";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["a..b", "semi;colon.txt", "line\nbreak"];
        api.regularPaths = ["/download/semi;colon.txt"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "semi;colon.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "semi;colon.txt"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/a..b", "stat:/download/semi;colon.txt",
          "copy:/download/semi;colon.txt->/sandbox/semi;colon.txt", "stat:/download/line\nbreak", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = ["/download/semi;colon.txt->/sandbox/semi;colon.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "semi;colon.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "semi;colon.txt"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "semi;colon.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "semi;colon.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001573
     * @tc.name EnvironmentSample_acceptedBoundary_1572
     * @tc.desc Accept embedded-dots/punctuation/newline boundaries, mask DFF; stat in order, copy only files, list
     * sandbox last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1572", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1572";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["a..b", "semi;colon.txt", "line\nbreak"];
        api.regularPaths = ["/download/semi;colon.txt", "/download/line\nbreak"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = ["preexisting.txt", "semi;colon.txt", "line\nbreak"];
        logAssertion(caseName, "result", result, expected01);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected01));
        const expected02: string[] = [
          "list:/download", "stat:/download/a..b", "stat:/download/semi;colon.txt",
          "copy:/download/semi;colon.txt->/sandbox/semi;colon.txt", "stat:/download/line\nbreak",
          "copy:/download/line\nbreak->/sandbox/line\nbreak", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] =
          ["/download/semi;colon.txt->/sandbox/semi;colon.txt", "/download/line\nbreak->/sandbox/line\nbreak"];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", "semi;colon.txt", "line\nbreak"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", "semi;colon.txt", "line\nbreak"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001574
     * @tc.name EnvironmentSample_acceptedBoundary_1573
     * @tc.desc Accept embedded-dots/punctuation/newline boundaries, mask FDD; stat in order, copy only files, list
     * sandbox last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1573", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1573";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["a..b", "semi;colon.txt", "line\nbreak"];
        api.regularPaths = ["/download/a..b"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "a..b"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "a..b"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/a..b", "copy:/download/a..b->/sandbox/a..b",
          "stat:/download/semi;colon.txt", "stat:/download/line\nbreak", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, ["/download/a..b->/sandbox/a..b"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/a..b->/sandbox/a..b"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "a..b"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "a..b"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "a..b"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "a..b"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001575
     * @tc.name EnvironmentSample_acceptedBoundary_1574
     * @tc.desc Accept embedded-dots/punctuation/newline boundaries, mask FDF; stat in order, copy only files, list
     * sandbox last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1574", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1574";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["a..b", "semi;colon.txt", "line\nbreak"];
        api.regularPaths = ["/download/a..b", "/download/line\nbreak"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "a..b", "line\nbreak"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "a..b", "line\nbreak"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/a..b", "copy:/download/a..b->/sandbox/a..b",
          "stat:/download/semi;colon.txt", "stat:/download/line\nbreak",
          "copy:/download/line\nbreak->/sandbox/line\nbreak", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = ["/download/a..b->/sandbox/a..b", "/download/line\nbreak->/sandbox/line\nbreak"];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", "a..b", "line\nbreak"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", "a..b", "line\nbreak"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001576
     * @tc.name EnvironmentSample_acceptedBoundary_1575
     * @tc.desc Accept embedded-dots/punctuation/newline boundaries, mask FFD; stat in order, copy only files, list
     * sandbox last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1575", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1575";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["a..b", "semi;colon.txt", "line\nbreak"];
        api.regularPaths = ["/download/a..b", "/download/semi;colon.txt"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "a..b", "semi;colon.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "a..b", "semi;colon.txt"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/a..b", "copy:/download/a..b->/sandbox/a..b",
          "stat:/download/semi;colon.txt", "copy:/download/semi;colon.txt->/sandbox/semi;colon.txt",
          "stat:/download/line\nbreak", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] =
          ["/download/a..b->/sandbox/a..b", "/download/semi;colon.txt->/sandbox/semi;colon.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", "a..b", "semi;colon.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", "a..b", "semi;colon.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001577
     * @tc.name EnvironmentSample_acceptedBoundary_1576
     * @tc.desc Accept embedded-dots/punctuation/newline boundaries, mask FFF; stat in order, copy only files, list
     * sandbox last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1576", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1576";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["a..b", "semi;colon.txt", "line\nbreak"];
        api.regularPaths = ["/download/a..b", "/download/semi;colon.txt", "/download/line\nbreak"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = ["preexisting.txt", "a..b", "semi;colon.txt", "line\nbreak"];
        logAssertion(caseName, "result", result, expected01);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected01));
        const expected02: string[] = [
          "list:/download", "stat:/download/a..b", "copy:/download/a..b->/sandbox/a..b",
          "stat:/download/semi;colon.txt", "copy:/download/semi;colon.txt->/sandbox/semi;colon.txt",
          "stat:/download/line\nbreak", "copy:/download/line\nbreak->/sandbox/line\nbreak", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = [
          "/download/a..b->/sandbox/a..b", "/download/semi;colon.txt->/sandbox/semi;colon.txt",
          "/download/line\nbreak->/sandbox/line\nbreak",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", "a..b", "semi;colon.txt", "line\nbreak"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", "a..b", "semi;colon.txt", "line\nbreak"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001578
     * @tc.name EnvironmentSample_acceptedBoundary_1577
     * @tc.desc Accept hidden/dot-substrings boundaries, mask DDD; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1577", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1577";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [".profile", "..suffix", "prefix.."];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/.profile", "stat:/download/..suffix", "stat:/download/prefix..",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001579
     * @tc.name EnvironmentSample_acceptedBoundary_1578
     * @tc.desc Accept hidden/dot-substrings boundaries, mask DDF; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1578", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1578";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [".profile", "..suffix", "prefix.."];
        api.regularPaths = ["/download/prefix.."];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "prefix.."]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "prefix.."]));
        const expected02: string[] = [
          "list:/download", "stat:/download/.profile", "stat:/download/..suffix", "stat:/download/prefix..",
          "copy:/download/prefix..->/sandbox/prefix..", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, ["/download/prefix..->/sandbox/prefix.."]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/prefix..->/sandbox/prefix.."]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "prefix.."]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "prefix.."]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "prefix.."]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "prefix.."]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001580
     * @tc.name EnvironmentSample_acceptedBoundary_1579
     * @tc.desc Accept hidden/dot-substrings boundaries, mask DFD; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1579", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1579";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [".profile", "..suffix", "prefix.."];
        api.regularPaths = ["/download/..suffix"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "..suffix"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "..suffix"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/.profile", "stat:/download/..suffix",
          "copy:/download/..suffix->/sandbox/..suffix", "stat:/download/prefix..", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, ["/download/..suffix->/sandbox/..suffix"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/..suffix->/sandbox/..suffix"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "..suffix"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "..suffix"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "..suffix"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "..suffix"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001581
     * @tc.name EnvironmentSample_acceptedBoundary_1580
     * @tc.desc Accept hidden/dot-substrings boundaries, mask DFF; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1580", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1580";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [".profile", "..suffix", "prefix.."];
        api.regularPaths = ["/download/..suffix", "/download/prefix.."];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "..suffix", "prefix.."]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "..suffix", "prefix.."]));
        const expected02: string[] = [
          "list:/download", "stat:/download/.profile", "stat:/download/..suffix",
          "copy:/download/..suffix->/sandbox/..suffix", "stat:/download/prefix..",
          "copy:/download/prefix..->/sandbox/prefix..", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = ["/download/..suffix->/sandbox/..suffix", "/download/prefix..->/sandbox/prefix.."];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", "..suffix", "prefix.."];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", "..suffix", "prefix.."];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001582
     * @tc.name EnvironmentSample_acceptedBoundary_1581
     * @tc.desc Accept hidden/dot-substrings boundaries, mask FDD; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1581", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1581";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [".profile", "..suffix", "prefix.."];
        api.regularPaths = ["/download/.profile"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", ".profile"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".profile"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/.profile", "copy:/download/.profile->/sandbox/.profile",
          "stat:/download/..suffix", "stat:/download/prefix..", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, ["/download/.profile->/sandbox/.profile"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/.profile->/sandbox/.profile"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".profile"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".profile"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".profile"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".profile"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001583
     * @tc.name EnvironmentSample_acceptedBoundary_1582
     * @tc.desc Accept hidden/dot-substrings boundaries, mask FDF; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1582", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1582";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [".profile", "..suffix", "prefix.."];
        api.regularPaths = ["/download/.profile", "/download/prefix.."];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", ".profile", "prefix.."]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".profile", "prefix.."]));
        const expected02: string[] = [
          "list:/download", "stat:/download/.profile", "copy:/download/.profile->/sandbox/.profile",
          "stat:/download/..suffix", "stat:/download/prefix..", "copy:/download/prefix..->/sandbox/prefix..",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = ["/download/.profile->/sandbox/.profile", "/download/prefix..->/sandbox/prefix.."];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", ".profile", "prefix.."];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", ".profile", "prefix.."];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001584
     * @tc.name EnvironmentSample_acceptedBoundary_1583
     * @tc.desc Accept hidden/dot-substrings boundaries, mask FFD; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1583", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1583";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [".profile", "..suffix", "prefix.."];
        api.regularPaths = ["/download/.profile", "/download/..suffix"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", ".profile", "..suffix"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".profile", "..suffix"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/.profile", "copy:/download/.profile->/sandbox/.profile",
          "stat:/download/..suffix", "copy:/download/..suffix->/sandbox/..suffix", "stat:/download/prefix..",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = ["/download/.profile->/sandbox/.profile", "/download/..suffix->/sandbox/..suffix"];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", ".profile", "..suffix"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", ".profile", "..suffix"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
  });
}
