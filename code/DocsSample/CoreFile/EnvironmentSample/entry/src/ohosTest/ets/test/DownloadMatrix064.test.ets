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

export default function downloadMatrix064Test(): void {
  describe('DownloadMatrix064', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001513
     * @tc.name EnvironmentSample_wholeList_dotdot_3_1512
     * @tc.desc Reject dotdot name at index 3, prefix DDD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_3_1512", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_3_1512";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ".."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001514
     * @tc.name EnvironmentSample_wholeList_dotdot_3_1513
     * @tc.desc Reject dotdot name at index 3, prefix DDF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_3_1513", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_3_1513";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ".."];
        api.regularPaths = ["/download/资料.txt", "/download/.."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001515
     * @tc.name EnvironmentSample_wholeList_dotdot_3_1514
     * @tc.desc Reject dotdot name at index 3, prefix DFD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_3_1514", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_3_1514";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ".."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001516
     * @tc.name EnvironmentSample_wholeList_dotdot_3_1515
     * @tc.desc Reject dotdot name at index 3, prefix DFF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_3_1515", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_3_1515";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ".."];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/.."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001517
     * @tc.name EnvironmentSample_wholeList_dotdot_3_1516
     * @tc.desc Reject dotdot name at index 3, prefix FDD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_3_1516", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_3_1516";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ".."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001518
     * @tc.name EnvironmentSample_wholeList_dotdot_3_1517
     * @tc.desc Reject dotdot name at index 3, prefix FDF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_3_1517", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_3_1517";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ".."];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt", "/download/.."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001519
     * @tc.name EnvironmentSample_wholeList_dotdot_3_1518
     * @tc.desc Reject dotdot name at index 3, prefix FFD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_3_1518", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_3_1518";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ".."];
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
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001520
     * @tc.name EnvironmentSample_wholeList_dotdot_3_1519
     * @tc.desc Reject dotdot name at index 3, prefix FFF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_dotdot_3_1519", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_dotdot_3_1519";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ".."];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/.."];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001521
     * @tc.name EnvironmentSample_wholeList_slash_0_1520
     * @tc.desc Reject slash name at index 0, prefix empty, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_slash_0_1520", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_slash_0_1520";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["nested/file", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/nested/file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001522
     * @tc.name EnvironmentSample_wholeList_slash_1_1521
     * @tc.desc Reject slash name at index 1, prefix D, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_slash_1_1521", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_slash_1_1521";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", "nested/file", "资料.txt", " spaced "];
        api.regularPaths = ["/download/nested/file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001523
     * @tc.name EnvironmentSample_wholeList_slash_1_1522
     * @tc.desc Reject slash name at index 1, prefix F, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_slash_1_1522", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_slash_1_1522";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", "nested/file", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/nested/file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001524
     * @tc.name EnvironmentSample_wholeList_slash_2_1523
     * @tc.desc Reject slash name at index 2, prefix DD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_slash_2_1523", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_slash_2_1523";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "nested/file", " spaced "];
        api.regularPaths = ["/download/nested/file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001525
     * @tc.name EnvironmentSample_wholeList_slash_2_1524
     * @tc.desc Reject slash name at index 2, prefix DF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_slash_2_1524", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_slash_2_1524";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "nested/file", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/nested/file"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001526
     * @tc.name EnvironmentSample_wholeList_slash_2_1525
     * @tc.desc Reject slash name at index 2, prefix FD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_slash_2_1525", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_slash_2_1525";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "nested/file", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/nested/file"];
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
