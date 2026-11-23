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

export default function downloadMatrix059Test(): void {
  describe('DownloadMatrix059', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001393
     * @tc.name EnvironmentSample_sandboxListFailure_1392_replaceFirst
     * @tc.desc Fail final sandbox list, mask DFDD, mutation replaceFirst; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1392_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1392_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001394
     * @tc.name EnvironmentSample_sandboxListFailure_1393_reverse
     * @tc.desc Fail final sandbox list, mask DFDD, mutation reverse; propagate identical error, return no result
     * and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1393_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1393_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001395
     * @tc.name EnvironmentSample_sandboxListFailure_1394_removeLast
     * @tc.desc Fail final sandbox list, mask DFDD, mutation removeLast; propagate identical error, return no result
     * and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1394_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1394_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001396
     * @tc.name EnvironmentSample_sandboxListFailure_1395_clear
     * @tc.desc Fail final sandbox list, mask DFDD, mutation clear; propagate identical error, return no result and
     * retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1395_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1395_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001397
     * @tc.name EnvironmentSample_sandboxListFailure_1396_duplicateFirst
     * @tc.desc Fail final sandbox list, mask DFDD, mutation duplicateFirst; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1396_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1396_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001398
     * @tc.name EnvironmentSample_sandboxListFailure_1397_none
     * @tc.desc Fail final sandbox list, mask DFDF, mutation none; propagate identical error, return no result and
     * retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1397_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1397_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = 'list:/sandbox';
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
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001399
     * @tc.name EnvironmentSample_sandboxListFailure_1398_appendTraversal
     * @tc.desc Fail final sandbox list, mask DFDF, mutation appendTraversal; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1398_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1398_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001400
     * @tc.name EnvironmentSample_sandboxListFailure_1399_replaceFirst
     * @tc.desc Fail final sandbox list, mask DFDF, mutation replaceFirst; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1399_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1399_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001401
     * @tc.name EnvironmentSample_sandboxListFailure_1400_reverse
     * @tc.desc Fail final sandbox list, mask DFDF, mutation reverse; propagate identical error, return no result
     * and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1400_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1400_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001402
     * @tc.name EnvironmentSample_sandboxListFailure_1401_removeLast
     * @tc.desc Fail final sandbox list, mask DFDF, mutation removeLast; propagate identical error, return no result
     * and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1401_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1401_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001403
     * @tc.name EnvironmentSample_sandboxListFailure_1402_clear
     * @tc.desc Fail final sandbox list, mask DFDF, mutation clear; propagate identical error, return no result and
     * retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1402_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1402_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001404
     * @tc.name EnvironmentSample_sandboxListFailure_1403_duplicateFirst
     * @tc.desc Fail final sandbox list, mask DFDF, mutation duplicateFirst; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1403_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1403_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/ spaced ->/sandbox/ spaced "];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001405
     * @tc.name EnvironmentSample_sandboxListFailure_1404_none
     * @tc.desc Fail final sandbox list, mask DFFD, mutation none; propagate identical error, return no result and
     * retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1404_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1404_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = 'list:/sandbox';
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
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001406
     * @tc.name EnvironmentSample_sandboxListFailure_1405_appendTraversal
     * @tc.desc Fail final sandbox list, mask DFFD, mutation appendTraversal; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1405_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1405_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001407
     * @tc.name EnvironmentSample_sandboxListFailure_1406_replaceFirst
     * @tc.desc Fail final sandbox list, mask DFFD, mutation replaceFirst; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1406_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1406_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001408
     * @tc.name EnvironmentSample_sandboxListFailure_1407_reverse
     * @tc.desc Fail final sandbox list, mask DFFD, mutation reverse; propagate identical error, return no result
     * and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1407_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1407_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001409
     * @tc.name EnvironmentSample_sandboxListFailure_1408_removeLast
     * @tc.desc Fail final sandbox list, mask DFFD, mutation removeLast; propagate identical error, return no result
     * and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1408_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1408_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001410
     * @tc.name EnvironmentSample_sandboxListFailure_1409_clear
     * @tc.desc Fail final sandbox list, mask DFFD, mutation clear; propagate identical error, return no result and
     * retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1409_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1409_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001411
     * @tc.name EnvironmentSample_sandboxListFailure_1410_duplicateFirst
     * @tc.desc Fail final sandbox list, mask DFFD, mutation duplicateFirst; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1410_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1410_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", "资料.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001412
     * @tc.name EnvironmentSample_sandboxListFailure_1411_none
     * @tc.desc Fail final sandbox list, mask DFFF, mutation none; propagate identical error, return no result and
     * retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1411_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1411_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = 'list:/sandbox';
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
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001413
     * @tc.name EnvironmentSample_sandboxListFailure_1412_appendTraversal
     * @tc.desc Fail final sandbox list, mask DFFF, mutation appendTraversal; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1412_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1412_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001414
     * @tc.name EnvironmentSample_sandboxListFailure_1413_replaceFirst
     * @tc.desc Fail final sandbox list, mask DFFF, mutation replaceFirst; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1413_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1413_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001415
     * @tc.name EnvironmentSample_sandboxListFailure_1414_reverse
     * @tc.desc Fail final sandbox list, mask DFFF, mutation reverse; propagate identical error, return no result
     * and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1414_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1414_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001416
     * @tc.name EnvironmentSample_sandboxListFailure_1415_removeLast
     * @tc.desc Fail final sandbox list, mask DFFF, mutation removeLast; propagate identical error, return no result
     * and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1415_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1415_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = 'list:/sandbox';
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
        const expected03: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/.hidden->/sandbox/.hidden", "/download/资料.txt->/sandbox/资料.txt",
          "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
  });
}
