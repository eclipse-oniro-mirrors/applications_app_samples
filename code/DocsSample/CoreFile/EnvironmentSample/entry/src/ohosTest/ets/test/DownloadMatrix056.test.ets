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

export default function downloadMatrix056Test(): void {
  describe('DownloadMatrix056', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001321
     * @tc.name EnvironmentSample_copyFailure_1320_3_none
     * @tc.desc Fail copy at entry 3, prefix DFD, mutation none; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1320_3_none", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1320_3_none";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
          "copy:/download/ spaced ->/sandbox/ spaced ",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001322
     * @tc.name EnvironmentSample_copyFailure_1321_3_appendTraversal
     * @tc.desc Fail copy at entry 3, prefix DFD, mutation appendTraversal; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1321_3_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1321_3_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
          "copy:/download/ spaced ->/sandbox/ spaced ",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001323
     * @tc.name EnvironmentSample_copyFailure_1322_3_replaceFirst
     * @tc.desc Fail copy at entry 3, prefix DFD, mutation replaceFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1322_3_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1322_3_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
          "copy:/download/ spaced ->/sandbox/ spaced ",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001324
     * @tc.name EnvironmentSample_copyFailure_1323_3_reverse
     * @tc.desc Fail copy at entry 3, prefix DFD, mutation reverse; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1323_3_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1323_3_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
          "copy:/download/ spaced ->/sandbox/ spaced ",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001325
     * @tc.name EnvironmentSample_copyFailure_1324_3_removeLast
     * @tc.desc Fail copy at entry 3, prefix DFD, mutation removeLast; propagate identical error, return no result,
     * stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1324_3_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1324_3_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
          "copy:/download/ spaced ->/sandbox/ spaced ",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001326
     * @tc.name EnvironmentSample_copyFailure_1325_3_clear
     * @tc.desc Fail copy at entry 3, prefix DFD, mutation clear; propagate identical error, return no result, stop
     * traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1325_3_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1325_3_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
          "copy:/download/ spaced ->/sandbox/ spaced ",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001327
     * @tc.name EnvironmentSample_copyFailure_1326_3_duplicateFirst
     * @tc.desc Fail copy at entry 3, prefix DFD, mutation duplicateFirst; propagate identical error, return no
     * result, stop traversal and retain committed copies.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_copyFailure_1326_3_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_copyFailure_1326_3_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.faultEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
        const injected: Error = api.failure;
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
        api.mutationKind = "duplicateFirst";
        let caught: Error | undefined = undefined;
        let result: string[] = [];
        try {
