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

export default function downloadMatrix065Test(): void {
  describe('DownloadMatrix065', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001537
     * @tc.name EnvironmentSample_wholeList_backslash_1_1536
     * @tc.desc Reject backslash name at index 1, prefix D, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_1_1536", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_1_1536";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", "nested\\file", "资料.txt", " spaced "];
        api.regularPaths = ["/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001538
     * @tc.name EnvironmentSample_wholeList_backslash_1_1537
     * @tc.desc Reject backslash name at index 1, prefix F, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_1_1537", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_1_1537";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", "nested\\file", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001539
     * @tc.name EnvironmentSample_wholeList_backslash_2_1538
     * @tc.desc Reject backslash name at index 2, prefix DD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_2_1538", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_2_1538";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "nested\\file", " spaced "];
        api.regularPaths = ["/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001540
     * @tc.name EnvironmentSample_wholeList_backslash_2_1539
     * @tc.desc Reject backslash name at index 2, prefix DF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_2_1539", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_2_1539";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "nested\\file", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001541
     * @tc.name EnvironmentSample_wholeList_backslash_2_1540
     * @tc.desc Reject backslash name at index 2, prefix FD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_2_1540", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_2_1540";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "nested\\file", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001542
     * @tc.name EnvironmentSample_wholeList_backslash_2_1541
     * @tc.desc Reject backslash name at index 2, prefix FF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_2_1541", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_2_1541";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "nested\\file", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001543
     * @tc.name EnvironmentSample_wholeList_backslash_3_1542
     * @tc.desc Reject backslash name at index 3, prefix DDD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_3_1542", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_3_1542";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "nested\\file"];
        api.regularPaths = ["/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001544
     * @tc.name EnvironmentSample_wholeList_backslash_3_1543
     * @tc.desc Reject backslash name at index 3, prefix DDF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_3_1543", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_3_1543";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "nested\\file"];
        api.regularPaths = ["/download/资料.txt", "/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001545
     * @tc.name EnvironmentSample_wholeList_backslash_3_1544
     * @tc.desc Reject backslash name at index 3, prefix DFD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_3_1544", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_3_1544";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "nested\\file"];
        api.regularPaths = ["/download/.hidden", "/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001546
     * @tc.name EnvironmentSample_wholeList_backslash_3_1545
     * @tc.desc Reject backslash name at index 3, prefix DFF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_3_1545", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_3_1545";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "nested\\file"];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001547
     * @tc.name EnvironmentSample_wholeList_backslash_3_1546
     * @tc.desc Reject backslash name at index 3, prefix FDD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_3_1546", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_3_1546";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "nested\\file"];
        api.regularPaths = ["/download/report.txt", "/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001548
     * @tc.name EnvironmentSample_wholeList_backslash_3_1547
     * @tc.desc Reject backslash name at index 3, prefix FDF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_3_1547", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_3_1547";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "nested\\file"];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt", "/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001549
     * @tc.name EnvironmentSample_wholeList_backslash_3_1548
     * @tc.desc Reject backslash name at index 3, prefix FFD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_3_1548", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_3_1548";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "nested\\file"];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001550
     * @tc.name EnvironmentSample_wholeList_backslash_3_1549
     * @tc.desc Reject backslash name at index 3, prefix FFF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_backslash_3_1549", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_backslash_3_1549";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "nested\\file"];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/nested\\file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001551
     * @tc.name EnvironmentSample_wholeList_nul_0_1550
     * @tc.desc Reject nul name at index 0, prefix empty, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_0_1550", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_0_1550";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["before\u0000after", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/before\u0000after"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001552
     * @tc.name EnvironmentSample_wholeList_nul_1_1551
     * @tc.desc Reject nul name at index 1, prefix D, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_1_1551", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_1_1551";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", "before\u0000after", "资料.txt", " spaced "];
        api.regularPaths = ["/download/before\u0000after"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001553
     * @tc.name EnvironmentSample_wholeList_nul_1_1552
     * @tc.desc Reject nul name at index 1, prefix F, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_1_1552", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_1_1552";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", "before\u0000after", "资料.txt", " spaced "];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001554
     * @tc.name EnvironmentSample_wholeList_nul_2_1553
     * @tc.desc Reject nul name at index 2, prefix DD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_2_1553", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_2_1553";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "before\u0000after", " spaced "];
        api.regularPaths = ["/download/before\u0000after"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001555
     * @tc.name EnvironmentSample_wholeList_nul_2_1554
     * @tc.desc Reject nul name at index 2, prefix DF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_2_1554", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_2_1554";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "before\u0000after", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/before\u0000after"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001556
     * @tc.name EnvironmentSample_wholeList_nul_2_1555
     * @tc.desc Reject nul name at index 2, prefix FD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_2_1555", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_2_1555";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "before\u0000after", " spaced "];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001557
     * @tc.name EnvironmentSample_wholeList_nul_2_1556
     * @tc.desc Reject nul name at index 2, prefix FF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_2_1556", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_2_1556";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "before\u0000after", " spaced "];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001558
     * @tc.name EnvironmentSample_wholeList_nul_3_1557
     * @tc.desc Reject nul name at index 3, prefix DDD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_3_1557", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_3_1557";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "before\u0000after"];
        api.regularPaths = ["/download/before\u0000after"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001559
     * @tc.name EnvironmentSample_wholeList_nul_3_1558
     * @tc.desc Reject nul name at index 3, prefix DDF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_3_1558", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_3_1558";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "before\u0000after"];
        api.regularPaths = ["/download/资料.txt", "/download/before\u0000after"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001560
     * @tc.name EnvironmentSample_wholeList_nul_3_1559
     * @tc.desc Reject nul name at index 3, prefix DFD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_nul_3_1559", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_nul_3_1559";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "before\u0000after"];
        api.regularPaths = ["/download/.hidden", "/download/before\u0000after"];
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
  });
}
