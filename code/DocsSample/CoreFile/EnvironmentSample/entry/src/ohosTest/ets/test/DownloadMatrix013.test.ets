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

export default function downloadMatrix013Test(): void {
  describe('DownloadMatrix013', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000289
     * @tc.name EnvironmentSample_snapshot_0288_DFDD_appendTraversal
     * @tc.desc Mask DFDD: appendTraversal at stat spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0288_DFDD_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0288_DFDD_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "appendTraversal";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000290
     * @tc.name EnvironmentSample_snapshot_0289_DFDD_appendTraversal
     * @tc.desc Mask DFDD: appendTraversal at stat spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0289_DFDD_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0289_DFDD_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "appendTraversal";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000291
     * @tc.name EnvironmentSample_snapshot_0290_DFDD_replaceFirst
     * @tc.desc Mask DFDD: replaceFirst at stat spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0290_DFDD_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0290_DFDD_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "replaceFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000292
     * @tc.name EnvironmentSample_snapshot_0291_DFDD_replaceFirst
     * @tc.desc Mask DFDD: replaceFirst at stat spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0291_DFDD_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0291_DFDD_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "replaceFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000293
     * @tc.name EnvironmentSample_snapshot_0292_DFDD_reverse
     * @tc.desc Mask DFDD: reverse at stat spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0292_DFDD_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0292_DFDD_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "reverse";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000294
     * @tc.name EnvironmentSample_snapshot_0293_DFDD_reverse
     * @tc.desc Mask DFDD: reverse at stat spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0293_DFDD_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0293_DFDD_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "reverse";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000295
     * @tc.name EnvironmentSample_snapshot_0294_DFDD_removeLast
     * @tc.desc Mask DFDD: removeLast at stat spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0294_DFDD_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0294_DFDD_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "removeLast";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000296
     * @tc.name EnvironmentSample_snapshot_0295_DFDD_removeLast
     * @tc.desc Mask DFDD: removeLast at stat spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0295_DFDD_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0295_DFDD_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "removeLast";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000297
     * @tc.name EnvironmentSample_snapshot_0296_DFDD_clear
     * @tc.desc Mask DFDD: clear at stat spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0296_DFDD_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0296_DFDD_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "clear";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000298
     * @tc.name EnvironmentSample_snapshot_0297_DFDD_clear
     * @tc.desc Mask DFDD: clear at stat spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0297_DFDD_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0297_DFDD_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "clear";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000299
     * @tc.name EnvironmentSample_snapshot_0298_DFDD_duplicateFirst
     * @tc.desc Mask DFDD: duplicateFirst at stat spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0298_DFDD_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0298_DFDD_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "duplicateFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000300
     * @tc.name EnvironmentSample_snapshot_0299_DFDD_duplicateFirst
     * @tc.desc Mask DFDD: duplicateFirst at stat spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0299_DFDD_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0299_DFDD_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden"];
        api.mutationEvent = "stat:/download/ spaced ";
        api.mutationKind = "duplicateFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000301
     * @tc.name EnvironmentSample_snapshot_0300_DFDF_appendTraversal
     * @tc.desc Mask DFDF: appendTraversal at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0300_DFDF_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0300_DFDF_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "appendTraversal";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", " spaced "]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000302
     * @tc.name EnvironmentSample_snapshot_0301_DFDF_appendTraversal
     * @tc.desc Mask DFDF: appendTraversal at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0301_DFDF_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0301_DFDF_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "appendTraversal";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000303
     * @tc.name EnvironmentSample_snapshot_0302_DFDF_replaceFirst
     * @tc.desc Mask DFDF: replaceFirst at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0302_DFDF_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0302_DFDF_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "replaceFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", " spaced "]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000304
     * @tc.name EnvironmentSample_snapshot_0303_DFDF_replaceFirst
     * @tc.desc Mask DFDF: replaceFirst at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0303_DFDF_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0303_DFDF_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "replaceFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000305
     * @tc.name EnvironmentSample_snapshot_0304_DFDF_reverse
     * @tc.desc Mask DFDF: reverse at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0304_DFDF_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0304_DFDF_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "reverse";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", " spaced "]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000306
     * @tc.name EnvironmentSample_snapshot_0305_DFDF_reverse
     * @tc.desc Mask DFDF: reverse at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0305_DFDF_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0305_DFDF_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "reverse";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000307
     * @tc.name EnvironmentSample_snapshot_0306_DFDF_removeLast
     * @tc.desc Mask DFDF: removeLast at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0306_DFDF_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0306_DFDF_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "removeLast";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", " spaced "]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000308
     * @tc.name EnvironmentSample_snapshot_0307_DFDF_removeLast
     * @tc.desc Mask DFDF: removeLast at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0307_DFDF_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0307_DFDF_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "removeLast";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000309
     * @tc.name EnvironmentSample_snapshot_0308_DFDF_clear
     * @tc.desc Mask DFDF: clear at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0308_DFDF_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0308_DFDF_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "clear";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", " spaced "]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000310
     * @tc.name EnvironmentSample_snapshot_0309_DFDF_clear
     * @tc.desc Mask DFDF: clear at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0309_DFDF_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0309_DFDF_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "clear";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000311
     * @tc.name EnvironmentSample_snapshot_0310_DFDF_duplicateFirst
     * @tc.desc Mask DFDF: duplicateFirst at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0310_DFDF_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0310_DFDF_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "duplicateFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", " spaced "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", " spaced "]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", " spaced ", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000312
     * @tc.name EnvironmentSample_snapshot_0311_DFDF_duplicateFirst
     * @tc.desc Mask DFDF: duplicateFirst at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0311_DFDF_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0311_DFDF_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "duplicateFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt", "stat:/download/ spaced ",
          "copy:/download/ spaced ->/sandbox/ spaced ", "list:/sandbox",
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
  });
}
