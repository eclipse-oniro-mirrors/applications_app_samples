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

export default function downloadMatrix050Test(): void {
  describe('DownloadMatrix050', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001177
     * @tc.name EnvironmentSample_statFailure_1176_2_reverse
     * @tc.desc Fail stat at entry 2, prefix DD, mutation reverse; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1176_2_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1176_2_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "reverse";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] =
          ["list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt"];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001178
     * @tc.name EnvironmentSample_statFailure_1177_2_removeLast
     * @tc.desc Fail stat at entry 2, prefix DD, mutation removeLast; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1177_2_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1177_2_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "removeLast";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] =
          ["list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt"];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001179
     * @tc.name EnvironmentSample_statFailure_1178_2_clear
     * @tc.desc Fail stat at entry 2, prefix DD, mutation clear; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1178_2_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1178_2_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "clear";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] =
          ["list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt"];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001180
     * @tc.name EnvironmentSample_statFailure_1179_2_duplicateFirst
     * @tc.desc Fail stat at entry 2, prefix DD, mutation duplicateFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1179_2_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1179_2_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "duplicateFirst";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] =
          ["list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt"];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001181
     * @tc.name EnvironmentSample_statFailure_1180_2_none
     * @tc.desc Fail stat at entry 2, prefix DF, mutation none; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1180_2_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1180_2_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/.hidden->/sandbox/.hidden"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/.hidden->/sandbox/.hidden"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001182
     * @tc.name EnvironmentSample_statFailure_1181_2_appendTraversal
     * @tc.desc Fail stat at entry 2, prefix DF, mutation appendTraversal; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1181_2_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1181_2_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "appendTraversal";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/.hidden->/sandbox/.hidden"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/.hidden->/sandbox/.hidden"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001183
     * @tc.name EnvironmentSample_statFailure_1182_2_replaceFirst
     * @tc.desc Fail stat at entry 2, prefix DF, mutation replaceFirst; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1182_2_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1182_2_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "replaceFirst";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/.hidden->/sandbox/.hidden"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/.hidden->/sandbox/.hidden"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001184
     * @tc.name EnvironmentSample_statFailure_1183_2_reverse
     * @tc.desc Fail stat at entry 2, prefix DF, mutation reverse; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1183_2_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1183_2_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "reverse";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/.hidden->/sandbox/.hidden"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/.hidden->/sandbox/.hidden"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001185
     * @tc.name EnvironmentSample_statFailure_1184_2_removeLast
     * @tc.desc Fail stat at entry 2, prefix DF, mutation removeLast; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1184_2_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1184_2_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "removeLast";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/.hidden->/sandbox/.hidden"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/.hidden->/sandbox/.hidden"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001186
     * @tc.name EnvironmentSample_statFailure_1185_2_clear
     * @tc.desc Fail stat at entry 2, prefix DF, mutation clear; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1185_2_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1185_2_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "clear";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/.hidden->/sandbox/.hidden"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/.hidden->/sandbox/.hidden"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001187
     * @tc.name EnvironmentSample_statFailure_1186_2_duplicateFirst
     * @tc.desc Fail stat at entry 2, prefix DF, mutation duplicateFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1186_2_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1186_2_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "duplicateFirst";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/.hidden->/sandbox/.hidden"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/.hidden->/sandbox/.hidden"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001188
     * @tc.name EnvironmentSample_statFailure_1187_2_none
     * @tc.desc Fail stat at entry 2, prefix FD, mutation none; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1187_2_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1187_2_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/report.txt->/sandbox/report.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/report.txt->/sandbox/report.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001189
     * @tc.name EnvironmentSample_statFailure_1188_2_appendTraversal
     * @tc.desc Fail stat at entry 2, prefix FD, mutation appendTraversal; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1188_2_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1188_2_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "appendTraversal";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/report.txt->/sandbox/report.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/report.txt->/sandbox/report.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001190
     * @tc.name EnvironmentSample_statFailure_1189_2_replaceFirst
     * @tc.desc Fail stat at entry 2, prefix FD, mutation replaceFirst; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1189_2_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1189_2_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "replaceFirst";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/report.txt->/sandbox/report.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/report.txt->/sandbox/report.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001191
     * @tc.name EnvironmentSample_statFailure_1190_2_reverse
     * @tc.desc Fail stat at entry 2, prefix FD, mutation reverse; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1190_2_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1190_2_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "reverse";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/report.txt->/sandbox/report.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/report.txt->/sandbox/report.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001192
     * @tc.name EnvironmentSample_statFailure_1191_2_removeLast
     * @tc.desc Fail stat at entry 2, prefix FD, mutation removeLast; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1191_2_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1191_2_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "removeLast";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/report.txt->/sandbox/report.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/report.txt->/sandbox/report.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001193
     * @tc.name EnvironmentSample_statFailure_1192_2_clear
     * @tc.desc Fail stat at entry 2, prefix FD, mutation clear; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1192_2_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1192_2_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "clear";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/report.txt->/sandbox/report.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/report.txt->/sandbox/report.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001194
     * @tc.name EnvironmentSample_statFailure_1193_2_duplicateFirst
     * @tc.desc Fail stat at entry 2, prefix FD, mutation duplicateFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1193_2_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1193_2_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "duplicateFirst";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.copied", api.copied, ["/download/report.txt->/sandbox/report.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/report.txt->/sandbox/report.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "report.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001195
     * @tc.name EnvironmentSample_statFailure_1194_2_none
     * @tc.desc Fail stat at entry 2, prefix FF, mutation none; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1194_2_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1194_2_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden"];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001196
     * @tc.name EnvironmentSample_statFailure_1195_2_appendTraversal
     * @tc.desc Fail stat at entry 2, prefix FF, mutation appendTraversal; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1195_2_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1195_2_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "appendTraversal";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden"];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001197
     * @tc.name EnvironmentSample_statFailure_1196_2_replaceFirst
     * @tc.desc Fail stat at entry 2, prefix FF, mutation replaceFirst; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1196_2_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1196_2_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "replaceFirst";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden"];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001198
     * @tc.name EnvironmentSample_statFailure_1197_2_reverse
     * @tc.desc Fail stat at entry 2, prefix FF, mutation reverse; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1197_2_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1197_2_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "reverse";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden"];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001199
     * @tc.name EnvironmentSample_statFailure_1198_2_removeLast
     * @tc.desc Fail stat at entry 2, prefix FF, mutation removeLast; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1198_2_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1198_2_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "removeLast";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
          result = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] =
          ["/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden"];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001200
     * @tc.name EnvironmentSample_statFailure_1199_2_clear
     * @tc.desc Fail stat at entry 2, prefix FF, mutation clear; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1199_2_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1199_2_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
        api.faultEvent = "stat:/download/资料.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "clear";
        let caught: Error | undefined = undefined;
