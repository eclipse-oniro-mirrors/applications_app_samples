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

export default function downloadMatrix063Test(): void {
  describe('DownloadMatrix063', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001489
     * @tc.name EnvironmentSample_wholeList_empty_3_1488
     * @tc.desc Reject empty name at index 3, prefix FFD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_3_1488", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_3_1488";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ""];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001490
     * @tc.name EnvironmentSample_wholeList_empty_3_1489
     * @tc.desc Reject empty name at index 3, prefix FFF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_3_1489", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_3_1489";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ""];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001491
     * @tc.name EnvironmentSample_wholeList_dot_0_1490
     * @tc.desc Reject dot name at index 0, prefix empty, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_0_1490", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_0_1490";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [".", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001492
     * @tc.name EnvironmentSample_wholeList_dot_1_1491
     * @tc.desc Reject dot name at index 1, prefix D, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_1_1491", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_1_1491";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".", "资料.txt", " spaced "];
        api.regularPaths = ["/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001493
     * @tc.name EnvironmentSample_wholeList_dot_1_1492
     * @tc.desc Reject dot name at index 1, prefix F, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_1_1492", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_1_1492";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001494
     * @tc.name EnvironmentSample_wholeList_dot_2_1493
     * @tc.desc Reject dot name at index 2, prefix DD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_2_1493", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_2_1493";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", ".", " spaced "];
        api.regularPaths = ["/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001495
     * @tc.name EnvironmentSample_wholeList_dot_2_1494
     * @tc.desc Reject dot name at index 2, prefix DF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_2_1494", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_2_1494";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", ".", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001496
     * @tc.name EnvironmentSample_wholeList_dot_2_1495
     * @tc.desc Reject dot name at index 2, prefix FD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_2_1495", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_2_1495";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", ".", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001497
     * @tc.name EnvironmentSample_wholeList_dot_2_1496
     * @tc.desc Reject dot name at index 2, prefix FF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_2_1496", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_2_1496";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", ".", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001498
     * @tc.name EnvironmentSample_wholeList_dot_3_1497
     * @tc.desc Reject dot name at index 3, prefix DDD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_3_1497", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_3_1497";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "."];
        api.regularPaths = ["/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001499
     * @tc.name EnvironmentSample_wholeList_dot_3_1498
     * @tc.desc Reject dot name at index 3, prefix DDF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_3_1498", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_3_1498";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "."];
        api.regularPaths = ["/download/资料.txt", "/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001500
     * @tc.name EnvironmentSample_wholeList_dot_3_1499
     * @tc.desc Reject dot name at index 3, prefix DFD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_3_1499", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_3_1499";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "."];
        api.regularPaths = ["/download/.hidden", "/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001501
     * @tc.name EnvironmentSample_wholeList_dot_3_1500
     * @tc.desc Reject dot name at index 3, prefix DFF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_3_1500", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_3_1500";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "."];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001502
     * @tc.name EnvironmentSample_wholeList_dot_3_1501
     * @tc.desc Reject dot name at index 3, prefix FDD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_3_1501", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_3_1501";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "."];
        api.regularPaths = ["/download/report.txt", "/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001503
     * @tc.name EnvironmentSample_wholeList_dot_3_1502
     * @tc.desc Reject dot name at index 3, prefix FDF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_3_1502", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_3_1502";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "."];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt", "/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001504
     * @tc.name EnvironmentSample_wholeList_dot_3_1503
     * @tc.desc Reject dot name at index 3, prefix FFD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_3_1503", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_3_1503";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "."];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001505
     * @tc.name EnvironmentSample_wholeList_dot_3_1504
     * @tc.desc Reject dot name at index 3, prefix FFF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dot_3_1504", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dot_3_1504";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", "."];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001506
     * @tc.name EnvironmentSample_wholeList_dotdot_0_1505
     * @tc.desc Reject dotdot name at index 0, prefix empty, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_0_1505", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_0_1505";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["..", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001507
     * @tc.name EnvironmentSample_wholeList_dotdot_1_1506
     * @tc.desc Reject dotdot name at index 1, prefix D, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_1_1506", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_1_1506";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", "..", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001508
     * @tc.name EnvironmentSample_wholeList_dotdot_1_1507
     * @tc.desc Reject dotdot name at index 1, prefix F, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_1_1507", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_1_1507";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", "..", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001509
     * @tc.name EnvironmentSample_wholeList_dotdot_2_1508
     * @tc.desc Reject dotdot name at index 2, prefix DD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_2_1508", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_2_1508";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "..", " spaced "];
        api.regularPaths = ["/download/.."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001510
     * @tc.name EnvironmentSample_wholeList_dotdot_2_1509
     * @tc.desc Reject dotdot name at index 2, prefix DF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_2_1509", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_2_1509";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "..", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/.."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001511
     * @tc.name EnvironmentSample_wholeList_dotdot_2_1510
     * @tc.desc Reject dotdot name at index 2, prefix FD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_2_1510", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_2_1510";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "..", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001512
     * @tc.name EnvironmentSample_wholeList_dotdot_2_1511
     * @tc.desc Reject dotdot name at index 2, prefix FF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_2_1511", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_2_1511";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "..", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/.."];
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
