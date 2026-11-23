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

export default function downloadMatrix049Test(): void {
  describe('DownloadMatrix049', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001153
     * @tc.name EnvironmentSample_statFailure_1152_0_none
     * @tc.desc Fail stat at entry 0, prefix empty, mutation none; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1152_0_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1152_0_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "stat:/download/report.txt";
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
        logAssertion(caseName, "api.events", api.events, ["list:/download", "stat:/download/report.txt"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download", "stat:/download/report.txt"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001154
     * @tc.name EnvironmentSample_statFailure_1153_0_appendTraversal
     * @tc.desc Fail stat at entry 0, prefix empty, mutation appendTraversal; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1153_0_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1153_0_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "stat:/download/report.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/report.txt";
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
        logAssertion(caseName, "api.events", api.events, ["list:/download", "stat:/download/report.txt"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download", "stat:/download/report.txt"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001155
     * @tc.name EnvironmentSample_statFailure_1154_0_replaceFirst
     * @tc.desc Fail stat at entry 0, prefix empty, mutation replaceFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1154_0_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1154_0_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "stat:/download/report.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/report.txt";
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
        logAssertion(caseName, "api.events", api.events, ["list:/download", "stat:/download/report.txt"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download", "stat:/download/report.txt"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001156
     * @tc.name EnvironmentSample_statFailure_1155_0_reverse
     * @tc.desc Fail stat at entry 0, prefix empty, mutation reverse; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1155_0_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1155_0_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "stat:/download/report.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/report.txt";
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
        logAssertion(caseName, "api.events", api.events, ["list:/download", "stat:/download/report.txt"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download", "stat:/download/report.txt"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001157
     * @tc.name EnvironmentSample_statFailure_1156_0_removeLast
     * @tc.desc Fail stat at entry 0, prefix empty, mutation removeLast; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1156_0_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1156_0_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "stat:/download/report.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/report.txt";
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
        logAssertion(caseName, "api.events", api.events, ["list:/download", "stat:/download/report.txt"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download", "stat:/download/report.txt"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001158
     * @tc.name EnvironmentSample_statFailure_1157_0_clear
     * @tc.desc Fail stat at entry 0, prefix empty, mutation clear; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1157_0_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1157_0_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "stat:/download/report.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/report.txt";
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
        logAssertion(caseName, "api.events", api.events, ["list:/download", "stat:/download/report.txt"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download", "stat:/download/report.txt"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001159
     * @tc.name EnvironmentSample_statFailure_1158_0_duplicateFirst
     * @tc.desc Fail stat at entry 0, prefix empty, mutation duplicateFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1158_0_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1158_0_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "stat:/download/report.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/report.txt";
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
        logAssertion(caseName, "api.events", api.events, ["list:/download", "stat:/download/report.txt"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download", "stat:/download/report.txt"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001160
     * @tc.name EnvironmentSample_statFailure_1159_1_none
     * @tc.desc Fail stat at entry 1, prefix D, mutation none; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1159_1_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1159_1_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
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
        const expected03: string[] = ["list:/download", "stat:/download/report.txt", "stat:/download/.hidden"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001161
     * @tc.name EnvironmentSample_statFailure_1160_1_appendTraversal
     * @tc.desc Fail stat at entry 1, prefix D, mutation appendTraversal; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1160_1_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1160_1_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/.hidden";
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
        const expected03: string[] = ["list:/download", "stat:/download/report.txt", "stat:/download/.hidden"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001162
     * @tc.name EnvironmentSample_statFailure_1161_1_replaceFirst
     * @tc.desc Fail stat at entry 1, prefix D, mutation replaceFirst; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1161_1_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1161_1_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/.hidden";
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
        const expected03: string[] = ["list:/download", "stat:/download/report.txt", "stat:/download/.hidden"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001163
     * @tc.name EnvironmentSample_statFailure_1162_1_reverse
     * @tc.desc Fail stat at entry 1, prefix D, mutation reverse; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1162_1_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1162_1_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/.hidden";
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
        const expected03: string[] = ["list:/download", "stat:/download/report.txt", "stat:/download/.hidden"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001164
     * @tc.name EnvironmentSample_statFailure_1163_1_removeLast
     * @tc.desc Fail stat at entry 1, prefix D, mutation removeLast; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1163_1_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1163_1_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/.hidden";
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
        const expected03: string[] = ["list:/download", "stat:/download/report.txt", "stat:/download/.hidden"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001165
     * @tc.name EnvironmentSample_statFailure_1164_1_clear
     * @tc.desc Fail stat at entry 1, prefix D, mutation clear; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1164_1_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1164_1_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/.hidden";
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
        const expected03: string[] = ["list:/download", "stat:/download/report.txt", "stat:/download/.hidden"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001166
     * @tc.name EnvironmentSample_statFailure_1165_1_duplicateFirst
     * @tc.desc Fail stat at entry 1, prefix D, mutation duplicateFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1165_1_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1165_1_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/.hidden";
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
        const expected03: string[] = ["list:/download", "stat:/download/report.txt", "stat:/download/.hidden"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001167
     * @tc.name EnvironmentSample_statFailure_1166_1_none
     * @tc.desc Fail stat at entry 1, prefix F, mutation none; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1166_1_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1166_1_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
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
          "stat:/download/.hidden",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001168
     * @tc.name EnvironmentSample_statFailure_1167_1_appendTraversal
     * @tc.desc Fail stat at entry 1, prefix F, mutation appendTraversal; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1167_1_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1167_1_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/.hidden";
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
          "stat:/download/.hidden",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001169
     * @tc.name EnvironmentSample_statFailure_1168_1_replaceFirst
     * @tc.desc Fail stat at entry 1, prefix F, mutation replaceFirst; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1168_1_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1168_1_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/.hidden";
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
          "stat:/download/.hidden",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001170
     * @tc.name EnvironmentSample_statFailure_1169_1_reverse
     * @tc.desc Fail stat at entry 1, prefix F, mutation reverse; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1169_1_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1169_1_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/.hidden";
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
          "stat:/download/.hidden",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001171
     * @tc.name EnvironmentSample_statFailure_1170_1_removeLast
     * @tc.desc Fail stat at entry 1, prefix F, mutation removeLast; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1170_1_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1170_1_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/.hidden";
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
          "stat:/download/.hidden",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001172
     * @tc.name EnvironmentSample_statFailure_1171_1_clear
     * @tc.desc Fail stat at entry 1, prefix F, mutation clear; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1171_1_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1171_1_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/.hidden";
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
          "stat:/download/.hidden",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001173
     * @tc.name EnvironmentSample_statFailure_1172_1_duplicateFirst
     * @tc.desc Fail stat at entry 1, prefix F, mutation duplicateFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1172_1_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1172_1_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.faultEvent = "stat:/download/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/.hidden";
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
          "stat:/download/.hidden",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001174
     * @tc.name EnvironmentSample_statFailure_1173_2_none
     * @tc.desc Fail stat at entry 2, prefix DD, mutation none; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1173_2_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1173_2_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001175
     * @tc.name EnvironmentSample_statFailure_1174_2_appendTraversal
     * @tc.desc Fail stat at entry 2, prefix DD, mutation appendTraversal; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1174_2_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1174_2_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001176
     * @tc.name EnvironmentSample_statFailure_1175_2_replaceFirst
     * @tc.desc Fail stat at entry 2, prefix DD, mutation replaceFirst; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1175_2_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1175_2_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/资料.txt"];
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
  });
}
