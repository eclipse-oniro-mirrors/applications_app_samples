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

export default function downloadMatrix053Test(): void {
  describe('DownloadMatrix053', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001249
     * @tc.name EnvironmentSample_statFailure_1248_3_clear
     * @tc.desc Fail stat at entry 3, prefix FFD, mutation clear; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1248_3_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1248_3_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.faultEvent = "stat:/download/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/ spaced ";
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
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001250
     * @tc.name EnvironmentSample_statFailure_1249_3_duplicateFirst
     * @tc.desc Fail stat at entry 3, prefix FFD, mutation duplicateFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1249_3_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1249_3_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.faultEvent = "stat:/download/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/ spaced ";
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
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001251
     * @tc.name EnvironmentSample_statFailure_1250_3_none
     * @tc.desc Fail stat at entry 3, prefix FFF, mutation none; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1250_3_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1250_3_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = "stat:/download/ spaced ";
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
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001252
     * @tc.name EnvironmentSample_statFailure_1251_3_appendTraversal
     * @tc.desc Fail stat at entry 3, prefix FFF, mutation appendTraversal; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1251_3_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1251_3_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = "stat:/download/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/ spaced ";
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
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001253
     * @tc.name EnvironmentSample_statFailure_1252_3_replaceFirst
     * @tc.desc Fail stat at entry 3, prefix FFF, mutation replaceFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1252_3_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1252_3_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = "stat:/download/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/ spaced ";
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
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001254
     * @tc.name EnvironmentSample_statFailure_1253_3_reverse
     * @tc.desc Fail stat at entry 3, prefix FFF, mutation reverse; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1253_3_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1253_3_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = "stat:/download/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/ spaced ";
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
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001255
     * @tc.name EnvironmentSample_statFailure_1254_3_removeLast
     * @tc.desc Fail stat at entry 3, prefix FFF, mutation removeLast; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1254_3_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1254_3_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = "stat:/download/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/ spaced ";
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
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001256
     * @tc.name EnvironmentSample_statFailure_1255_3_clear
     * @tc.desc Fail stat at entry 3, prefix FFF, mutation clear; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1255_3_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1255_3_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = "stat:/download/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/ spaced ";
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
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001257
     * @tc.name EnvironmentSample_statFailure_1256_3_duplicateFirst
     * @tc.desc Fail stat at entry 3, prefix FFF, mutation duplicateFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_statFailure_1256_3_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_statFailure_1256_3_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = "stat:/download/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "stat:/download/ spaced ";
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
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001258
     * @tc.name EnvironmentSample_copyFailure_1257_0_none
     * @tc.desc Fail copy at entry 0, prefix empty, mutation none; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1257_0_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1257_0_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
          ["list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001259
     * @tc.name EnvironmentSample_copyFailure_1258_0_appendTraversal
     * @tc.desc Fail copy at entry 0, prefix empty, mutation appendTraversal; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1258_0_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1258_0_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "copy:/download/report.txt->/sandbox/report.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
          ["list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001260
     * @tc.name EnvironmentSample_copyFailure_1259_0_replaceFirst
     * @tc.desc Fail copy at entry 0, prefix empty, mutation replaceFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1259_0_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1259_0_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "copy:/download/report.txt->/sandbox/report.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
          ["list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001261
     * @tc.name EnvironmentSample_copyFailure_1260_0_reverse
     * @tc.desc Fail copy at entry 0, prefix empty, mutation reverse; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1260_0_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1260_0_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "copy:/download/report.txt->/sandbox/report.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
          ["list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001262
     * @tc.name EnvironmentSample_copyFailure_1261_0_removeLast
     * @tc.desc Fail copy at entry 0, prefix empty, mutation removeLast; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1261_0_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1261_0_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "copy:/download/report.txt->/sandbox/report.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
          ["list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001263
     * @tc.name EnvironmentSample_copyFailure_1262_0_clear
     * @tc.desc Fail copy at entry 0, prefix empty, mutation clear; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1262_0_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1262_0_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "copy:/download/report.txt->/sandbox/report.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
          ["list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001264
     * @tc.name EnvironmentSample_copyFailure_1263_0_duplicateFirst
     * @tc.desc Fail copy at entry 0, prefix empty, mutation duplicateFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1263_0_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1263_0_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt"];
        api.faultEvent = "copy:/download/report.txt->/sandbox/report.txt";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
          ["list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001265
     * @tc.name EnvironmentSample_copyFailure_1264_1_none
     * @tc.desc Fail copy at entry 1, prefix D, mutation none; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1264_1_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1264_1_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "copy:/download/.hidden->/sandbox/.hidden";
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
          "copy:/download/.hidden->/sandbox/.hidden",
        ];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001266
     * @tc.name EnvironmentSample_copyFailure_1265_1_appendTraversal
     * @tc.desc Fail copy at entry 1, prefix D, mutation appendTraversal; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1265_1_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1265_1_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "copy:/download/.hidden->/sandbox/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
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
          "copy:/download/.hidden->/sandbox/.hidden",
        ];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001267
     * @tc.name EnvironmentSample_copyFailure_1266_1_replaceFirst
     * @tc.desc Fail copy at entry 1, prefix D, mutation replaceFirst; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1266_1_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1266_1_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "copy:/download/.hidden->/sandbox/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
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
          "copy:/download/.hidden->/sandbox/.hidden",
        ];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001268
     * @tc.name EnvironmentSample_copyFailure_1267_1_reverse
     * @tc.desc Fail copy at entry 1, prefix D, mutation reverse; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1267_1_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1267_1_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "copy:/download/.hidden->/sandbox/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
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
          "copy:/download/.hidden->/sandbox/.hidden",
        ];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001269
     * @tc.name EnvironmentSample_copyFailure_1268_1_removeLast
     * @tc.desc Fail copy at entry 1, prefix D, mutation removeLast; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1268_1_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1268_1_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "copy:/download/.hidden->/sandbox/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
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
          "copy:/download/.hidden->/sandbox/.hidden",
        ];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001270
     * @tc.name EnvironmentSample_copyFailure_1269_1_clear
     * @tc.desc Fail copy at entry 1, prefix D, mutation clear; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1269_1_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1269_1_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "copy:/download/.hidden->/sandbox/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
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
          "copy:/download/.hidden->/sandbox/.hidden",
        ];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001271
     * @tc.name EnvironmentSample_copyFailure_1270_1_duplicateFirst
     * @tc.desc Fail copy at entry 1, prefix D, mutation duplicateFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1270_1_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1270_1_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = "copy:/download/.hidden->/sandbox/.hidden";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
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
          "copy:/download/.hidden->/sandbox/.hidden",
        ];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001272
     * @tc.name EnvironmentSample_copyFailure_1271_1_none
     * @tc.desc Fail copy at entry 1, prefix F, mutation none; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1271_1_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1271_1_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.faultEvent = "copy:/download/.hidden->/sandbox/.hidden";
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
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden",
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
  });
}
