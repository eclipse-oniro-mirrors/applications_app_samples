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
