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

export default function downloadMatrix038Test(): void {
  describe('DownloadMatrix038', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000889
     * @tc.name EnvironmentSample_snapshot_0888_FFDF_appendTraversal
     * @tc.desc Mask FFDF: appendTraversal at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0888_FFDF_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0888_FFDF_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000890
     * @tc.name EnvironmentSample_snapshot_0889_FFDF_appendTraversal
     * @tc.desc Mask FFDF: appendTraversal at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0889_FFDF_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0889_FFDF_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000891
     * @tc.name EnvironmentSample_snapshot_0890_FFDF_replaceFirst
     * @tc.desc Mask FFDF: replaceFirst at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0890_FFDF_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0890_FFDF_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000892
     * @tc.name EnvironmentSample_snapshot_0891_FFDF_replaceFirst
     * @tc.desc Mask FFDF: replaceFirst at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0891_FFDF_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0891_FFDF_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000893
     * @tc.name EnvironmentSample_snapshot_0892_FFDF_reverse
     * @tc.desc Mask FFDF: reverse at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0892_FFDF_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0892_FFDF_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000894
     * @tc.name EnvironmentSample_snapshot_0893_FFDF_reverse
     * @tc.desc Mask FFDF: reverse at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0893_FFDF_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0893_FFDF_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000895
     * @tc.name EnvironmentSample_snapshot_0894_FFDF_removeLast
     * @tc.desc Mask FFDF: removeLast at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0894_FFDF_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0894_FFDF_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000896
     * @tc.name EnvironmentSample_snapshot_0895_FFDF_removeLast
     * @tc.desc Mask FFDF: removeLast at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0895_FFDF_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0895_FFDF_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000897
     * @tc.name EnvironmentSample_snapshot_0896_FFDF_clear
     * @tc.desc Mask FFDF: clear at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0896_FFDF_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0896_FFDF_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000898
     * @tc.name EnvironmentSample_snapshot_0897_FFDF_clear
     * @tc.desc Mask FFDF: clear at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0897_FFDF_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0897_FFDF_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000899
     * @tc.name EnvironmentSample_snapshot_0898_FFDF_duplicateFirst
     * @tc.desc Mask FFDF: duplicateFirst at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0898_FFDF_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0898_FFDF_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000900
     * @tc.name EnvironmentSample_snapshot_0899_FFDF_duplicateFirst
     * @tc.desc Mask FFDF: duplicateFirst at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0899_FFDF_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0899_FFDF_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000901
     * @tc.name EnvironmentSample_snapshot_0900_FFDF_appendTraversal
     * @tc.desc Mask FFDF: appendTraversal at copy ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0900_FFDF_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0900_FFDF_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000902
     * @tc.name EnvironmentSample_snapshot_0901_FFDF_appendTraversal
     * @tc.desc Mask FFDF: appendTraversal at copy ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0901_FFDF_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0901_FFDF_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000903
     * @tc.name EnvironmentSample_snapshot_0902_FFDF_replaceFirst
     * @tc.desc Mask FFDF: replaceFirst at copy ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0902_FFDF_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0902_FFDF_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000904
     * @tc.name EnvironmentSample_snapshot_0903_FFDF_replaceFirst
     * @tc.desc Mask FFDF: replaceFirst at copy ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0903_FFDF_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0903_FFDF_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000905
     * @tc.name EnvironmentSample_snapshot_0904_FFDF_reverse
     * @tc.desc Mask FFDF: reverse at copy ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0904_FFDF_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0904_FFDF_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000906
     * @tc.name EnvironmentSample_snapshot_0905_FFDF_reverse
     * @tc.desc Mask FFDF: reverse at copy ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0905_FFDF_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0905_FFDF_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000907
     * @tc.name EnvironmentSample_snapshot_0906_FFDF_removeLast
     * @tc.desc Mask FFDF: removeLast at copy ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0906_FFDF_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0906_FFDF_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000908
     * @tc.name EnvironmentSample_snapshot_0907_FFDF_removeLast
     * @tc.desc Mask FFDF: removeLast at copy ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0907_FFDF_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0907_FFDF_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000909
     * @tc.name EnvironmentSample_snapshot_0908_FFDF_clear
     * @tc.desc Mask FFDF: clear at copy ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0908_FFDF_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0908_FFDF_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000910
     * @tc.name EnvironmentSample_snapshot_0909_FFDF_clear
     * @tc.desc Mask FFDF: clear at copy ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0909_FFDF_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0909_FFDF_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000911
     * @tc.name EnvironmentSample_snapshot_0910_FFDF_duplicateFirst
     * @tc.desc Mask FFDF: duplicateFirst at copy ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0910_FFDF_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0910_FFDF_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/report.txt->/sandbox/report.txt";
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
