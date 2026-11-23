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

export default function downloadMatrix062Test(): void {
  describe('DownloadMatrix062', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001465
     * @tc.name EnvironmentSample_sandboxListFailure_1464_removeLast
     * @tc.desc Fail final sandbox list, mask FFFD, mutation removeLast; propagate identical error, return no result
     * and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1464_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1464_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
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
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001466
     * @tc.name EnvironmentSample_sandboxListFailure_1465_clear
     * @tc.desc Fail final sandbox list, mask FFFD, mutation clear; propagate identical error, return no result and
     * retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1465_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1465_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
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
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001467
     * @tc.name EnvironmentSample_sandboxListFailure_1466_duplicateFirst
     * @tc.desc Fail final sandbox list, mask FFFD, mutation duplicateFirst; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1466_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1466_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt"];
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
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001468
     * @tc.name EnvironmentSample_sandboxListFailure_1467_none
     * @tc.desc Fail final sandbox list, mask FFFF, mutation none; propagate identical error, return no result and
     * retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1467_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1467_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
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
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001469
     * @tc.name EnvironmentSample_sandboxListFailure_1468_appendTraversal
     * @tc.desc Fail final sandbox list, mask FFFF, mutation appendTraversal; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1468_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1468_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
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
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001470
     * @tc.name EnvironmentSample_sandboxListFailure_1469_replaceFirst
     * @tc.desc Fail final sandbox list, mask FFFF, mutation replaceFirst; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1469_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1469_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
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
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001471
     * @tc.name EnvironmentSample_sandboxListFailure_1470_reverse
     * @tc.desc Fail final sandbox list, mask FFFF, mutation reverse; propagate identical error, return no result
     * and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1470_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1470_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
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
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001472
     * @tc.name EnvironmentSample_sandboxListFailure_1471_removeLast
     * @tc.desc Fail final sandbox list, mask FFFF, mutation removeLast; propagate identical error, return no result
     * and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1471_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1471_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
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
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001473
     * @tc.name EnvironmentSample_sandboxListFailure_1472_clear
     * @tc.desc Fail final sandbox list, mask FFFF, mutation clear; propagate identical error, return no result and
     * retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1472_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1472_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
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
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001474
     * @tc.name EnvironmentSample_sandboxListFailure_1473_duplicateFirst
     * @tc.desc Fail final sandbox list, mask FFFF, mutation duplicateFirst; propagate identical error, return no
     * result and retain committed copies without rollback.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sandboxListFailure_1473_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_sandboxListFailure_1473_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
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
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = [
          "/download/report.txt->/sandbox/report.txt", "/download/.hidden->/sandbox/.hidden",
          "/download/资料.txt->/sandbox/资料.txt", "/download/ spaced ->/sandbox/ spaced ",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected04);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["preexisting.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected05);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected05));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001475
     * @tc.name EnvironmentSample_sourceListFailureBeforeSnapshot
     * @tc.desc Fail initial source list; propagate identical error before stat, copy or final list.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_sourceListFailureBeforeSnapshot", 0, (): void => {
      const caseName: string = "EnvironmentSample_sourceListFailureBeforeSnapshot";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/资料.txt", "/download/ spaced "];
        api.faultEvent = 'list:/download';
        const injected: Error = api.failure;
        let caught: Error | undefined = undefined;
        try {
          importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === injected", caught === injected, true);
        expect(caught === injected).assertEqual(true);
        logAssertion(caseName, "api.events", api.events, ["list:/download"]);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(["list:/download"]));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001476
     * @tc.name EnvironmentSample_wholeList_empty_0_1475
     * @tc.desc Reject empty name at index 0, prefix empty, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_0_1475", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_0_1475";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001477
     * @tc.name EnvironmentSample_wholeList_empty_1_1476
     * @tc.desc Reject empty name at index 1, prefix D, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_1_1476", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_1_1476";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", "", "资料.txt", " spaced "];
        api.regularPaths = ["/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001478
     * @tc.name EnvironmentSample_wholeList_empty_1_1477
     * @tc.desc Reject empty name at index 1, prefix F, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_1_1477", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_1_1477";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", "", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001479
     * @tc.name EnvironmentSample_wholeList_empty_2_1478
     * @tc.desc Reject empty name at index 2, prefix DD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_2_1478", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_2_1478";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "", " spaced "];
        api.regularPaths = ["/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001480
     * @tc.name EnvironmentSample_wholeList_empty_2_1479
     * @tc.desc Reject empty name at index 2, prefix DF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_2_1479", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_2_1479";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001481
     * @tc.name EnvironmentSample_wholeList_empty_2_1480
     * @tc.desc Reject empty name at index 2, prefix FD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_2_1480", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_2_1480";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001482
     * @tc.name EnvironmentSample_wholeList_empty_2_1481
     * @tc.desc Reject empty name at index 2, prefix FF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_2_1481", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_2_1481";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "", " spaced "];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001483
     * @tc.name EnvironmentSample_wholeList_empty_3_1482
     * @tc.desc Reject empty name at index 3, prefix DDD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_3_1482", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_3_1482";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ""];
        api.regularPaths = ["/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001484
     * @tc.name EnvironmentSample_wholeList_empty_3_1483
     * @tc.desc Reject empty name at index 3, prefix DDF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_3_1483", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_3_1483";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ""];
        api.regularPaths = ["/download/资料.txt", "/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001485
     * @tc.name EnvironmentSample_wholeList_empty_3_1484
     * @tc.desc Reject empty name at index 3, prefix DFD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_3_1484", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_3_1484";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ""];
        api.regularPaths = ["/download/.hidden", "/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001486
     * @tc.name EnvironmentSample_wholeList_empty_3_1485
     * @tc.desc Reject empty name at index 3, prefix DFF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_3_1485", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_3_1485";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ""];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt", "/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001487
     * @tc.name EnvironmentSample_wholeList_empty_3_1486
     * @tc.desc Reject empty name at index 3, prefix FDD, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_3_1486", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_3_1486";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ""];
        api.regularPaths = ["/download/report.txt", "/download/"];
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001488
     * @tc.name EnvironmentSample_wholeList_empty_3_1487
     * @tc.desc Reject empty name at index 3, prefix FDF, before any stat/copy; repair to repaired.txt and retry
     * successfully.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_wholeList_empty_3_1487", 0, (): void => {
      const caseName: string = "EnvironmentSample_wholeList_empty_3_1487";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", ""];
        api.regularPaths = ["/download/report.txt", "/download/资料.txt", "/download/"];
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
