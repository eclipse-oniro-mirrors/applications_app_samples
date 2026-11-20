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
