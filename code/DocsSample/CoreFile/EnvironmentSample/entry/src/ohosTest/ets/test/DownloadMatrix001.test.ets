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

export default function downloadMatrix001Test(): void {
  describe('DownloadMatrix001', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000001
     * @tc.name EnvironmentSample_snapshot_0000_DDDD_appendTraversal
     * @tc.desc Mask DDDD: appendTraversal at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * Reject a later invalid listing without stat when the same path was already validated.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0000_DDDD_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0000_DDDD_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "appendTraversal";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        result.push('caller-only');
        logAssertion(caseName, "sandboxAlias", sandboxAlias, ["preexisting.txt", "sandbox-after-return"]);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(["preexisting.txt", "sandbox-after-return"]));
        api.mutationEvent = '';
        const previousEvents: number = api.events.length;
        let laterMessage: string = '';
        let laterResult: string[] = [];
        try {
          laterResult = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          laterMessage = (error as Error).message;
        }
        logAssertion(caseName, "laterMessage", laterMessage, "Invalid download entry");
        expect(laterMessage).assertEqual("Invalid download entry");
        logAssertion(caseName, "laterResult", laterResult, []);
        expect(JSON.stringify(laterResult)).assertEqual(JSON.stringify([]));
        const expected06: string[] = ["list:/download"];
        logAssertion(caseName, "api.events.slice(previousEvents)", api.events.slice(previousEvents), expected06);
        expect(JSON.stringify(api.events.slice(previousEvents))).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000002
     * @tc.name EnvironmentSample_snapshot_0001_DDDD_appendTraversal
     * @tc.desc Mask DDDD: appendTraversal at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0001_DDDD_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0001_DDDD_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "appendTraversal";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000003
     * @tc.name EnvironmentSample_snapshot_0002_DDDD_replaceFirst
     * @tc.desc Mask DDDD: replaceFirst at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * Reject a later invalid listing without stat when the same path was already validated.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0002_DDDD_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0002_DDDD_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "replaceFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        result.push('caller-only');
        logAssertion(caseName, "sandboxAlias", sandboxAlias, ["preexisting.txt", "sandbox-after-return"]);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(["preexisting.txt", "sandbox-after-return"]));
        api.mutationEvent = '';
        const previousEvents: number = api.events.length;
        let laterMessage: string = '';
        let laterResult: string[] = [];
        try {
          laterResult = importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          laterMessage = (error as Error).message;
        }
        logAssertion(caseName, "laterMessage", laterMessage, "Invalid download entry");
        expect(laterMessage).assertEqual("Invalid download entry");
        logAssertion(caseName, "laterResult", laterResult, []);
        expect(JSON.stringify(laterResult)).assertEqual(JSON.stringify([]));
        const expected06: string[] = ["list:/download"];
        logAssertion(caseName, "api.events.slice(previousEvents)", api.events.slice(previousEvents), expected06);
        expect(JSON.stringify(api.events.slice(previousEvents))).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000004
     * @tc.name EnvironmentSample_snapshot_0003_DDDD_replaceFirst
     * @tc.desc Mask DDDD: replaceFirst at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0003_DDDD_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0003_DDDD_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "replaceFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000005
     * @tc.name EnvironmentSample_snapshot_0004_DDDD_reverse
     * @tc.desc Mask DDDD: reverse at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0004_DDDD_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0004_DDDD_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "reverse";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        result.push('caller-only');
        logAssertion(caseName, "sandboxAlias", sandboxAlias, ["preexisting.txt", "sandbox-after-return"]);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(["preexisting.txt", "sandbox-after-return"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000006
     * @tc.name EnvironmentSample_snapshot_0005_DDDD_reverse
     * @tc.desc Mask DDDD: reverse at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0005_DDDD_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0005_DDDD_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "reverse";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000007
     * @tc.name EnvironmentSample_snapshot_0006_DDDD_removeLast
     * @tc.desc Mask DDDD: removeLast at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0006_DDDD_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0006_DDDD_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "removeLast";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        result.push('caller-only');
        logAssertion(caseName, "sandboxAlias", sandboxAlias, ["preexisting.txt", "sandbox-after-return"]);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(["preexisting.txt", "sandbox-after-return"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000008
     * @tc.name EnvironmentSample_snapshot_0007_DDDD_removeLast
     * @tc.desc Mask DDDD: removeLast at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0007_DDDD_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0007_DDDD_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "removeLast";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000009
     * @tc.name EnvironmentSample_snapshot_0008_DDDD_clear
     * @tc.desc Mask DDDD: clear at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0008_DDDD_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0008_DDDD_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "clear";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        result.push('caller-only');
        logAssertion(caseName, "sandboxAlias", sandboxAlias, ["preexisting.txt", "sandbox-after-return"]);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(["preexisting.txt", "sandbox-after-return"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000010
     * @tc.name EnvironmentSample_snapshot_0009_DDDD_clear
     * @tc.desc Mask DDDD: clear at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0009_DDDD_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0009_DDDD_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "clear";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000011
     * @tc.name EnvironmentSample_snapshot_0010_DDDD_duplicateFirst
     * @tc.desc Mask DDDD: duplicateFirst at stat ordinary-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0010_DDDD_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0010_DDDD_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "duplicateFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        result.push('caller-only');
        logAssertion(caseName, "sandboxAlias", sandboxAlias, ["preexisting.txt", "sandbox-after-return"]);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(["preexisting.txt", "sandbox-after-return"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000012
     * @tc.name EnvironmentSample_snapshot_0011_DDDD_duplicateFirst
     * @tc.desc Mask DDDD: duplicateFirst at stat ordinary-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0011_DDDD_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0011_DDDD_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/report.txt";
        api.mutationKind = "duplicateFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000013
     * @tc.name EnvironmentSample_snapshot_0012_DDDD_appendTraversal
     * @tc.desc Mask DDDD: appendTraversal at stat hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0012_DDDD_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0012_DDDD_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "appendTraversal";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        result.push('caller-only');
        logAssertion(caseName, "sandboxAlias", sandboxAlias, ["preexisting.txt", "sandbox-after-return"]);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(["preexisting.txt", "sandbox-after-return"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000014
     * @tc.name EnvironmentSample_snapshot_0013_DDDD_appendTraversal
     * @tc.desc Mask DDDD: appendTraversal at stat hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0013_DDDD_appendTraversal", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0013_DDDD_appendTraversal";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "appendTraversal";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000015
     * @tc.name EnvironmentSample_snapshot_0014_DDDD_replaceFirst
     * @tc.desc Mask DDDD: replaceFirst at stat hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0014_DDDD_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0014_DDDD_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "replaceFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        result.push('caller-only');
        logAssertion(caseName, "sandboxAlias", sandboxAlias, ["preexisting.txt", "sandbox-after-return"]);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(["preexisting.txt", "sandbox-after-return"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000016
     * @tc.name EnvironmentSample_snapshot_0015_DDDD_replaceFirst
     * @tc.desc Mask DDDD: replaceFirst at stat hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0015_DDDD_replaceFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0015_DDDD_replaceFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "replaceFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000017
     * @tc.name EnvironmentSample_snapshot_0016_DDDD_reverse
     * @tc.desc Mask DDDD: reverse at stat hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0016_DDDD_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0016_DDDD_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "reverse";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        result.push('caller-only');
        logAssertion(caseName, "sandboxAlias", sandboxAlias, ["preexisting.txt", "sandbox-after-return"]);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(["preexisting.txt", "sandbox-after-return"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000018
     * @tc.name EnvironmentSample_snapshot_0017_DDDD_reverse
     * @tc.desc Mask DDDD: reverse at stat hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0017_DDDD_reverse", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0017_DDDD_reverse";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "reverse";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000019
     * @tc.name EnvironmentSample_snapshot_0018_DDDD_removeLast
     * @tc.desc Mask DDDD: removeLast at stat hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0018_DDDD_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0018_DDDD_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "removeLast";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        result.push('caller-only');
        logAssertion(caseName, "sandboxAlias", sandboxAlias, ["preexisting.txt", "sandbox-after-return"]);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(["preexisting.txt", "sandbox-after-return"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000020
     * @tc.name EnvironmentSample_snapshot_0019_DDDD_removeLast
     * @tc.desc Mask DDDD: removeLast at stat hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0019_DDDD_removeLast", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0019_DDDD_removeLast";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "removeLast";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000021
     * @tc.name EnvironmentSample_snapshot_0020_DDDD_clear
     * @tc.desc Mask DDDD: clear at stat hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0020_DDDD_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0020_DDDD_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "clear";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        result.push('caller-only');
        logAssertion(caseName, "sandboxAlias", sandboxAlias, ["preexisting.txt", "sandbox-after-return"]);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(["preexisting.txt", "sandbox-after-return"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000022
     * @tc.name EnvironmentSample_snapshot_0021_DDDD_clear
     * @tc.desc Mask DDDD: clear at stat hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0021_DDDD_clear", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0021_DDDD_clear";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "clear";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
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
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000023
     * @tc.name EnvironmentSample_snapshot_0022_DDDD_duplicateFirst
     * @tc.desc Mask DDDD: duplicateFirst at stat hidden-file; sandbox alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0022_DDDD_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0022_DDDD_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "duplicateFirst";
        const sandboxAlias: string[] = api.sandboxEntries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
          "stat:/download/ spaced ", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected01);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected01));
        sandboxAlias.push('sandbox-after-return');
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        result.push('caller-only');
        logAssertion(caseName, "sandboxAlias", sandboxAlias, ["preexisting.txt", "sandbox-after-return"]);
        expect(JSON.stringify(sandboxAlias)).assertEqual(JSON.stringify(["preexisting.txt", "sandbox-after-return"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_000024
     * @tc.name EnvironmentSample_snapshot_0023_DDDD_duplicateFirst
     * @tc.desc Mask DDDD: duplicateFirst at stat hidden-file; source alias; ordered, two-way isolated result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_snapshot_0023_DDDD_duplicateFirst", 0, (): void => {
      const caseName: string = "EnvironmentSample_snapshot_0023_DDDD_duplicateFirst";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["report.txt", ".hidden", "资料.txt", " spaced "];
        api.mutationEvent = "stat:/download/.hidden";
        api.mutationKind = "duplicateFirst";
        api.aliasSandboxToSource = true;
        const sourceAlias: string[] = api.entries;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = [
          "list:/download", "stat:/download/report.txt", "stat:/download/.hidden", "stat:/download/资料.txt",
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
  });
}
