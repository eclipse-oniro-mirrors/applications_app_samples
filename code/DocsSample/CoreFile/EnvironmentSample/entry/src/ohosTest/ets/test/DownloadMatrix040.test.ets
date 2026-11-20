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

export default function downloadMatrix040Test(): void {
  describe('DownloadMatrix040', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000937
     * @tc.name EnvironmentSample_snapshot_0936_FFDF_appendTraversal
     * @tc.desc Mask FFDF: appendTraversal at stat Unicode-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0936_FFDF_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0936_FFDF_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "appendTraversal";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        const expected02: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000938
     * @tc.name EnvironmentSample_snapshot_0937_FFDF_appendTraversal
     * @tc.desc Mask FFDF: appendTraversal at stat Unicode-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0937_FFDF_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0937_FFDF_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "appendTraversal";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sourceAlias.push('source-after-return');
        const expected02: string[] = ["report.txt", ".hidden", "资料.txt", " spaced ", "../late"];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        result.push('caller-only');
        const expected03: string[] = ["report.txt", ".hidden", "资料.txt", " spaced ", "../late", "source-after-return"];
        logAssertion(caseName, "sourceAlias", sourceAlias, expected03);
        expect(JSON.stringify(sourceAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000939
     * @tc.name EnvironmentSample_snapshot_0938_FFDF_replaceFirst
     * @tc.desc Mask FFDF: replaceFirst at stat Unicode-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0938_FFDF_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0938_FFDF_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "replaceFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        const expected02: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000940
     * @tc.name EnvironmentSample_snapshot_0939_FFDF_replaceFirst
     * @tc.desc Mask FFDF: replaceFirst at stat Unicode-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0939_FFDF_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0939_FFDF_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "replaceFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sourceAlias.push('source-after-return');
        logAssertion(caseName, "result", result, ["evil\\late", ".hidden", "资料.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["evil\\late", ".hidden", "资料.txt", " spaced "]));
        result.push('caller-only');
        const expected03: string[] = ["evil\\late", ".hidden", "资料.txt", " spaced ", "source-after-return"];
        logAssertion(caseName, "sourceAlias", sourceAlias, expected03);
        expect(JSON.stringify(sourceAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000941
     * @tc.name EnvironmentSample_snapshot_0940_FFDF_reverse
     * @tc.desc Mask FFDF: reverse at stat Unicode-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0940_FFDF_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0940_FFDF_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "reverse";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        const expected02: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000942
     * @tc.name EnvironmentSample_snapshot_0941_FFDF_reverse
     * @tc.desc Mask FFDF: reverse at stat Unicode-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0941_FFDF_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0941_FFDF_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "reverse";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sourceAlias.push('source-after-return');
        logAssertion(caseName, "result", result, [" spaced ", "资料.txt", ".hidden", "report.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([" spaced ", "资料.txt", ".hidden", "report.txt"]));
        result.push('caller-only');
        const expected03: string[] = [" spaced ", "资料.txt", ".hidden", "report.txt", "source-after-return"];
        logAssertion(caseName, "sourceAlias", sourceAlias, expected03);
        expect(JSON.stringify(sourceAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000943
     * @tc.name EnvironmentSample_snapshot_0942_FFDF_removeLast
     * @tc.desc Mask FFDF: removeLast at stat Unicode-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0942_FFDF_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0942_FFDF_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "removeLast";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        const expected02: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000944
     * @tc.name EnvironmentSample_snapshot_0943_FFDF_removeLast
     * @tc.desc Mask FFDF: removeLast at stat Unicode-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0943_FFDF_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0943_FFDF_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "removeLast";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sourceAlias.push('source-after-return');
        logAssertion(caseName, "result", result, ["report.txt", ".hidden", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["report.txt", ".hidden", "资料.txt"]));
        result.push('caller-only');
        const expected03: string[] = ["report.txt", ".hidden", "资料.txt", "source-after-return"];
        logAssertion(caseName, "sourceAlias", sourceAlias, expected03);
        expect(JSON.stringify(sourceAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000945
     * @tc.name EnvironmentSample_snapshot_0944_FFDF_clear
     * @tc.desc Mask FFDF: clear at stat Unicode-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0944_FFDF_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0944_FFDF_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "clear";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        const expected02: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000946
     * @tc.name EnvironmentSample_snapshot_0945_FFDF_clear
     * @tc.desc Mask FFDF: clear at stat Unicode-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0945_FFDF_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0945_FFDF_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "clear";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sourceAlias.push('source-after-return');
        logAssertion(caseName, "result", result, []);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
        result.push('caller-only');
        logAssertion(caseName, "sourceAlias", sourceAlias, ["source-after-return"]);
        expect(JSON.stringify(sourceAlias)).assertEqual(JSON.stringify(["source-after-return"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000947
     * @tc.name EnvironmentSample_snapshot_0946_FFDF_duplicateFirst
     * @tc.desc Mask FFDF: duplicateFirst at stat Unicode-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0946_FFDF_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0946_FFDF_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "duplicateFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        const expected02: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000948
     * @tc.name EnvironmentSample_snapshot_0947_FFDF_duplicateFirst
     * @tc.desc Mask FFDF: duplicateFirst at stat Unicode-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0947_FFDF_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0947_FFDF_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/资料.txt";
        api.mutationKind = "duplicateFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sourceAlias.push('source-after-return');
        const expected02: string[] = ["report.txt", "report.txt", ".hidden", "资料.txt", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        result.push('caller-only');
        const expected03: string[] =
          ["report.txt", "report.txt", ".hidden", "资料.txt", " spaced ", "source-after-return"];
        logAssertion(caseName, "sourceAlias", sourceAlias, expected03);
        expect(JSON.stringify(sourceAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000949
     * @tc.name EnvironmentSample_snapshot_0948_FFDF_appendTraversal
     * @tc.desc Mask FFDF: appendTraversal at stat spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0948_FFDF_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0948_FFDF_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "appendTraversal";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        const expected02: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000950
     * @tc.name EnvironmentSample_snapshot_0949_FFDF_appendTraversal
     * @tc.desc Mask FFDF: appendTraversal at stat spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0949_FFDF_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0949_FFDF_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "appendTraversal";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sourceAlias.push('source-after-return');
        const expected02: string[] = ["report.txt", ".hidden", "资料.txt", " spaced ", "../late"];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        result.push('caller-only');
        const expected03: string[] = ["report.txt", ".hidden", "资料.txt", " spaced ", "../late", "source-after-return"];
        logAssertion(caseName, "sourceAlias", sourceAlias, expected03);
        expect(JSON.stringify(sourceAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000951
     * @tc.name EnvironmentSample_snapshot_0950_FFDF_replaceFirst
     * @tc.desc Mask FFDF: replaceFirst at stat spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0950_FFDF_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0950_FFDF_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "replaceFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        const expected02: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000952
     * @tc.name EnvironmentSample_snapshot_0951_FFDF_replaceFirst
     * @tc.desc Mask FFDF: replaceFirst at stat spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0951_FFDF_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0951_FFDF_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "replaceFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sourceAlias.push('source-after-return');
        logAssertion(caseName, "result", result, ["evil\\late", ".hidden", "资料.txt", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["evil\\late", ".hidden", "资料.txt", " spaced "]));
        result.push('caller-only');
        const expected03: string[] = ["evil\\late", ".hidden", "资料.txt", " spaced ", "source-after-return"];
        logAssertion(caseName, "sourceAlias", sourceAlias, expected03);
        expect(JSON.stringify(sourceAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000953
     * @tc.name EnvironmentSample_snapshot_0952_FFDF_reverse
     * @tc.desc Mask FFDF: reverse at stat spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0952_FFDF_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0952_FFDF_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "reverse";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        const expected02: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced "];
        logAssertion(caseName, "result", result, expected02);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected02));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000954
     * @tc.name EnvironmentSample_snapshot_0953_FFDF_reverse
     * @tc.desc Mask FFDF: reverse at stat spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0953_FFDF_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0953_FFDF_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "reverse";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sourceAlias.push('source-after-return');
        logAssertion(caseName, "result", result, [" spaced ", "资料.txt", ".hidden", "report.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([" spaced ", "资料.txt", ".hidden", "report.txt"]));
        result.push('caller-only');
        const expected03: string[] = [" spaced ", "资料.txt", ".hidden", "report.txt", "source-after-return"];
        logAssertion(caseName, "sourceAlias", sourceAlias, expected03);
        expect(JSON.stringify(sourceAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000955
     * @tc.name EnvironmentSample_snapshot_0954_FFDF_removeLast
     * @tc.desc Mask FFDF: removeLast at stat spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0954_FFDF_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0954_FFDF_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "removeLast";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
