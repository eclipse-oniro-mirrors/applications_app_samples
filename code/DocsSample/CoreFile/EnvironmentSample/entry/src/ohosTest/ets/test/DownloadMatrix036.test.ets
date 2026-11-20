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

export default function downloadMatrix036Test(): void {
  describe('DownloadMatrix036', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000841
     * @tc.name EnvironmentSample_snapshot_0840_FFDD_appendTraversal
     * @tc.desc Mask FFDD: appendTraversal at stat hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0840_FFDD_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0840_FFDD_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "appendTraversal";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000842
     * @tc.name EnvironmentSample_snapshot_0841_FFDD_appendTraversal
     * @tc.desc Mask FFDD: appendTraversal at stat hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0841_FFDD_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0841_FFDD_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "appendTraversal";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000843
     * @tc.name EnvironmentSample_snapshot_0842_FFDD_replaceFirst
     * @tc.desc Mask FFDD: replaceFirst at stat hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0842_FFDD_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0842_FFDD_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "replaceFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000844
     * @tc.name EnvironmentSample_snapshot_0843_FFDD_replaceFirst
     * @tc.desc Mask FFDD: replaceFirst at stat hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0843_FFDD_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0843_FFDD_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "replaceFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000845
     * @tc.name EnvironmentSample_snapshot_0844_FFDD_reverse
     * @tc.desc Mask FFDD: reverse at stat hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0844_FFDD_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0844_FFDD_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "reverse";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000846
     * @tc.name EnvironmentSample_snapshot_0845_FFDD_reverse
     * @tc.desc Mask FFDD: reverse at stat hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0845_FFDD_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0845_FFDD_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "reverse";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000847
     * @tc.name EnvironmentSample_snapshot_0846_FFDD_removeLast
     * @tc.desc Mask FFDD: removeLast at stat hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0846_FFDD_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0846_FFDD_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "removeLast";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000848
     * @tc.name EnvironmentSample_snapshot_0847_FFDD_removeLast
     * @tc.desc Mask FFDD: removeLast at stat hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0847_FFDD_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0847_FFDD_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "removeLast";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000849
     * @tc.name EnvironmentSample_snapshot_0848_FFDD_clear
     * @tc.desc Mask FFDD: clear at stat hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0848_FFDD_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0848_FFDD_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "clear";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000850
     * @tc.name EnvironmentSample_snapshot_0849_FFDD_clear
     * @tc.desc Mask FFDD: clear at stat hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0849_FFDD_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0849_FFDD_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "clear";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000851
     * @tc.name EnvironmentSample_snapshot_0850_FFDD_duplicateFirst
     * @tc.desc Mask FFDD: duplicateFirst at stat hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0850_FFDD_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0850_FFDD_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "duplicateFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000852
     * @tc.name EnvironmentSample_snapshot_0851_FFDD_duplicateFirst
     * @tc.desc Mask FFDD: duplicateFirst at stat hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0851_FFDD_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0851_FFDD_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "duplicateFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000853
     * @tc.name EnvironmentSample_snapshot_0852_FFDD_appendTraversal
     * @tc.desc Mask FFDD: appendTraversal at copy hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0852_FFDD_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0852_FFDD_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
        api.mutationKind = "appendTraversal";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000854
     * @tc.name EnvironmentSample_snapshot_0853_FFDD_appendTraversal
     * @tc.desc Mask FFDD: appendTraversal at copy hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0853_FFDD_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0853_FFDD_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
        api.mutationKind = "appendTraversal";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000855
     * @tc.name EnvironmentSample_snapshot_0854_FFDD_replaceFirst
     * @tc.desc Mask FFDD: replaceFirst at copy hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0854_FFDD_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0854_FFDD_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
        api.mutationKind = "replaceFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000856
     * @tc.name EnvironmentSample_snapshot_0855_FFDD_replaceFirst
     * @tc.desc Mask FFDD: replaceFirst at copy hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0855_FFDD_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0855_FFDD_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
        api.mutationKind = "replaceFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000857
     * @tc.name EnvironmentSample_snapshot_0856_FFDD_reverse
     * @tc.desc Mask FFDD: reverse at copy hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0856_FFDD_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0856_FFDD_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
        api.mutationKind = "reverse";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000858
     * @tc.name EnvironmentSample_snapshot_0857_FFDD_reverse
     * @tc.desc Mask FFDD: reverse at copy hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0857_FFDD_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0857_FFDD_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
        api.mutationKind = "reverse";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000859
     * @tc.name EnvironmentSample_snapshot_0858_FFDD_removeLast
     * @tc.desc Mask FFDD: removeLast at copy hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0858_FFDD_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0858_FFDD_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
        api.mutationKind = "removeLast";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000860
     * @tc.name EnvironmentSample_snapshot_0859_FFDD_removeLast
     * @tc.desc Mask FFDD: removeLast at copy hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0859_FFDD_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0859_FFDD_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
        api.mutationKind = "removeLast";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000861
     * @tc.name EnvironmentSample_snapshot_0860_FFDD_clear
     * @tc.desc Mask FFDD: clear at copy hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0860_FFDD_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0860_FFDD_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
        api.mutationKind = "clear";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "report.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", "report.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000862
     * @tc.name EnvironmentSample_snapshot_0861_FFDD_clear
     * @tc.desc Mask FFDD: clear at copy hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0861_FFDD_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0861_FFDD_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
        api.mutationKind = "clear";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000863
     * @tc.name EnvironmentSample_snapshot_0862_FFDD_duplicateFirst
     * @tc.desc Mask FFDD: duplicateFirst at copy hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0862_FFDD_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0862_FFDD_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/report.txt", "/download/.hidden"];
        api.mutationEvent = "copy:/download/.hidden->/sandbox/.hidden";
        api.mutationKind = "duplicateFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "copy:/download/report.txt->/sandbox/report.txt",
          "stat:/download/.hidden", "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", "report.txt", ".hidden"]);
