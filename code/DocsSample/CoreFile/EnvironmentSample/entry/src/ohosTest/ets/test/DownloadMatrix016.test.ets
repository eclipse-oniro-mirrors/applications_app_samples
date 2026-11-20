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

export default function downloadMatrix016Test(): void {
  describe('DownloadMatrix016', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000361
     * @tc.name EnvironmentSample_snapshot_0360_DFDF_appendTraversal
     * @tc.desc Mask DFDF: appendTraversal at copy spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0360_DFDF_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0360_DFDF_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000362
     * @tc.name EnvironmentSample_snapshot_0361_DFDF_appendTraversal
     * @tc.desc Mask DFDF: appendTraversal at copy spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0361_DFDF_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0361_DFDF_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000363
     * @tc.name EnvironmentSample_snapshot_0362_DFDF_replaceFirst
     * @tc.desc Mask DFDF: replaceFirst at copy spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0362_DFDF_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0362_DFDF_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000364
     * @tc.name EnvironmentSample_snapshot_0363_DFDF_replaceFirst
     * @tc.desc Mask DFDF: replaceFirst at copy spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0363_DFDF_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0363_DFDF_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000365
     * @tc.name EnvironmentSample_snapshot_0364_DFDF_reverse
     * @tc.desc Mask DFDF: reverse at copy spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0364_DFDF_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0364_DFDF_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000366
     * @tc.name EnvironmentSample_snapshot_0365_DFDF_reverse
     * @tc.desc Mask DFDF: reverse at copy spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0365_DFDF_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0365_DFDF_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000367
     * @tc.name EnvironmentSample_snapshot_0366_DFDF_removeLast
     * @tc.desc Mask DFDF: removeLast at copy spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0366_DFDF_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0366_DFDF_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000368
     * @tc.name EnvironmentSample_snapshot_0367_DFDF_removeLast
     * @tc.desc Mask DFDF: removeLast at copy spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0367_DFDF_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0367_DFDF_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000369
     * @tc.name EnvironmentSample_snapshot_0368_DFDF_clear
     * @tc.desc Mask DFDF: clear at copy spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0368_DFDF_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0368_DFDF_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000370
     * @tc.name EnvironmentSample_snapshot_0369_DFDF_clear
     * @tc.desc Mask DFDF: clear at copy spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0369_DFDF_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0369_DFDF_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000371
     * @tc.name EnvironmentSample_snapshot_0370_DFDF_duplicateFirst
     * @tc.desc Mask DFDF: duplicateFirst at copy spaced-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0370_DFDF_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0370_DFDF_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000372
     * @tc.name EnvironmentSample_snapshot_0371_DFDF_duplicateFirst
     * @tc.desc Mask DFDF: duplicateFirst at copy spaced-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0371_DFDF_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0371_DFDF_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/ spaced "];
        api.mutationEvent = "copy:/download/ spaced ->/sandbox/ spaced ";
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
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000373
     * @tc.name EnvironmentSample_snapshot_0372_DFFD_appendTraversal
     * @tc.desc Mask DFFD: appendTraversal at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0372_DFFD_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0372_DFFD_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "appendTraversal";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", "资料.txt"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", "资料.txt", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000374
     * @tc.name EnvironmentSample_snapshot_0373_DFFD_appendTraversal
     * @tc.desc Mask DFFD: appendTraversal at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0373_DFFD_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0373_DFFD_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "appendTraversal";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000375
     * @tc.name EnvironmentSample_snapshot_0374_DFFD_replaceFirst
     * @tc.desc Mask DFFD: replaceFirst at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0374_DFFD_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0374_DFFD_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "replaceFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", "资料.txt"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", "资料.txt", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000376
     * @tc.name EnvironmentSample_snapshot_0375_DFFD_replaceFirst
     * @tc.desc Mask DFFD: replaceFirst at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0375_DFFD_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0375_DFFD_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "replaceFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000377
     * @tc.name EnvironmentSample_snapshot_0376_DFFD_reverse
     * @tc.desc Mask DFFD: reverse at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0376_DFFD_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0376_DFFD_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "reverse";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", "资料.txt"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", "资料.txt", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000378
     * @tc.name EnvironmentSample_snapshot_0377_DFFD_reverse
     * @tc.desc Mask DFFD: reverse at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0377_DFFD_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0377_DFFD_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "reverse";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000379
     * @tc.name EnvironmentSample_snapshot_0378_DFFD_removeLast
     * @tc.desc Mask DFFD: removeLast at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0378_DFFD_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0378_DFFD_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "removeLast";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", "资料.txt"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", "资料.txt", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000380
     * @tc.name EnvironmentSample_snapshot_0379_DFFD_removeLast
     * @tc.desc Mask DFFD: removeLast at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0379_DFFD_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0379_DFFD_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "removeLast";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000381
     * @tc.name EnvironmentSample_snapshot_0380_DFFD_clear
     * @tc.desc Mask DFFD: clear at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0380_DFFD_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0380_DFFD_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "clear";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", "资料.txt"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", "资料.txt", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000382
     * @tc.name EnvironmentSample_snapshot_0381_DFFD_clear
     * @tc.desc Mask DFFD: clear at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0381_DFFD_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0381_DFFD_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "clear";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000383
     * @tc.name EnvironmentSample_snapshot_0382_DFFD_duplicateFirst
     * @tc.desc Mask DFFD: duplicateFirst at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0382_DFFD_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0382_DFFD_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "duplicateFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt", ".hidden", "资料.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", ".hidden", "资料.txt"]));
        result.push('caller-only');
        const expected03: string[] = ["preexisting.txt", ".hidden", "资料.txt", "sandbox-after-return"];
        logAssertion(caseName, "sandboxAlias", sandboxAlias, expected03);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000384
     * @tc.name EnvironmentSample_snapshot_0383_DFFD_duplicateFirst
     * @tc.desc Mask DFFD: duplicateFirst at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0383_DFFD_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0383_DFFD_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.regularPaths = ["/download/.hidden", "/download/资料.txt"];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "duplicateFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden",
          "copy:/download/.hidden->/sandbox/.hidden", "stat:/download/资料.txt",
          "copy:/download/资料.txt->/sandbox/资料.txt", "stat:/download/ spaced ", "list:/sandbox",
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
