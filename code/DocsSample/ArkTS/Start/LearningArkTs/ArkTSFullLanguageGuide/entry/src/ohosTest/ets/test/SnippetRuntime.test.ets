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

import { describe, beforeEach, it, expect, beforeAll } from '@ohos/hypium';
import { loadCompiledDocSnippets } from '../../../main/ets/snippets/CompiledDocs';
import { runFullLanguageGuideSmoke } from '../../../main/ets/snippets/CompiledSmoke';
import { logBegin, logEnd } from './ArkTSGuideUiSupport';

const SMOKE_PREFIX: string = 'ArkTS Full Language Guide: ';
let smokeResult: string = '';
let smokeError: string = '';

function countOccurrences(text: string, token: string): number {
  let count: number = 0;
  let index: number = text.indexOf(token);
  while (index >= 0) {
    count++;
    index = text.indexOf(token, index + token.length);
  }
  return count;
}

function splitSmoke(result: string): string[] {
  const colon: number = result.indexOf(': ');
  if (colon < 0) {
    return [];
  }
  return result.substring(colon + 2).split(', ');
}

/**
 * snippets/CompiledDocs.ets 与 snippets/CompiledSmoke.ets 的运行时行为。
 */
export default function ArkTSSnippetRuntimeTest(): void {
  describe('ArkTSSnippetRuntimeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    beforeAll(async () => {
      try {
        smokeResult = await runFullLanguageGuideSmoke();
      } catch (err) {
        smokeError = JSON.stringify(err);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testLoadCompiledDocSnippetsCount0001
     * @tc.name      testLoadCompiledDocSnippetsCount0001
     * @tc.desc      Verify the compiled documentation snippets report 15 loaded modules
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testLoadCompiledDocSnippetsCount0001', 0, () => {
      logBegin('testLoadCompiledDocSnippetsCount0001');
      const count: number = loadCompiledDocSnippets();
      expect(count).assertEqual(15);
      expect(Number.isInteger(count)).assertTrue();
      expect(count).assertEqual(loadCompiledDocSnippets());
      logEnd('testLoadCompiledDocSnippetsCount0001');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testSmokeRunsWithoutError0002
     * @tc.name      testSmokeRunsWithoutError0002
     * @tc.desc      Verify runFullLanguageGuideSmoke resolves without throwing
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testSmokeRunsWithoutError0002', 0, () => {
      logBegin('testSmokeRunsWithoutError0002');
      expect(smokeError).assertEqual('');
      expect(smokeResult.length > 0).assertTrue();
      logEnd('testSmokeRunsWithoutError0002');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testSmokeExactOutput0003
     * @tc.name      testSmokeExactOutput0003
     * @tc.desc      Verify the smoke summary equals the documented composite string
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testSmokeExactOutput0003', 0, () => {
      logBegin('testSmokeExactOutput0003');
      expect(smokeResult).assertEqual('ArkTS Full Language Guide: Alice, 270, snippets=15');
      expect(smokeResult.indexOf(SMOKE_PREFIX)).assertEqual(0);
      logEnd('testSmokeExactOutput0003');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testSmokeTitlePrefix0004
     * @tc.name      testSmokeTitlePrefix0004
     * @tc.desc      Verify the smoke result starts with the guide title and colon separator
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testSmokeTitlePrefix0004', 0, () => {
      logBegin('testSmokeTitlePrefix0004');
      expect(smokeResult.startsWith(SMOKE_PREFIX)).assertTrue();
      expect(smokeResult.indexOf('ArkTS Full Language Guide')).assertEqual(0);
      logEnd('testSmokeTitlePrefix0004');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testSmokeFirstName0005
     * @tc.name      testSmokeFirstName0005
     * @tc.desc      Verify the service reports the first inserted user as Alice
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testSmokeFirstName0005', 0, () => {
      logBegin('testSmokeFirstName0005');
      const parts: string[] = splitSmoke(smokeResult);
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual('Alice');
      expect(parts[0].length).assertEqual(5);
      logEnd('testSmokeFirstName0005');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testSmokeScoreTotal0006
     * @tc.name      testSmokeScoreTotal0006
     * @tc.desc      Verify the score summary adds 80 + 90 + 100 to 270
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testSmokeScoreTotal0006', 0, () => {
      logBegin('testSmokeScoreTotal0006');
      const parts: string[] = splitSmoke(smokeResult);
      expect(parts[1]).assertEqual('270');
      expect(Number(parts[1])).assertEqual(80 + 90 + 100);
      expect(Number.isInteger(Number(parts[1]))).assertTrue();
      logEnd('testSmokeScoreTotal0006');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testSmokeSnippetCountSegment0007
     * @tc.name      testSmokeSnippetCountSegment0007
     * @tc.desc      Verify the trailing segment reports snippets=15 consistent with loadCompiledDocSnippets
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testSmokeSnippetCountSegment0007', 0, () => {
      logBegin('testSmokeSnippetCountSegment0007');
      const parts: string[] = splitSmoke(smokeResult);
      expect(parts[2]).assertEqual('snippets=15');
      expect(parts[2]).assertEqual('snippets=' + loadCompiledDocSnippets());
      logEnd('testSmokeSnippetCountSegment0007');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testSmokeSegmentSeparators0008
     * @tc.name      testSmokeSegmentSeparators0008
     * @tc.desc      Verify the smoke summary uses exactly two comma-space separators
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testSmokeSegmentSeparators0008', 0, () => {
      logBegin('testSmokeSegmentSeparators0008');
      expect(countOccurrences(smokeResult, ', ')).assertEqual(2);
      expect(countOccurrences(smokeResult, ': ')).assertEqual(1);
      logEnd('testSmokeSegmentSeparators0008');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testSmokeResultIsStable0009
     * @tc.name      testSmokeResultIsStable0009
     * @tc.desc      Verify calling the smoke routine again produces the same string
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testSmokeResultIsStable0009', 0, async () => {
      logBegin('testSmokeResultIsStable0009');
      const again: string = await runFullLanguageGuideSmoke();
      expect(again).assertEqual(smokeResult);
      expect(again.length).assertEqual(smokeResult.length);
      logEnd('testSmokeResultIsStable0009');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testSmokeReturnsAsyncValue0010
     * @tc.name      testSmokeReturnsAsyncValue0010
     * @tc.desc      Verify runFullLanguageGuideSmoke yields a Promise that resolves to a string
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testSmokeReturnsAsyncValue0010', 0, async () => {
      logBegin('testSmokeReturnsAsyncValue0010');
      const pending: Promise<string> = runFullLanguageGuideSmoke();
      expect(pending instanceof Promise).assertTrue();
      const resolved: string = await pending;
      expect(typeof resolved).assertEqual('string');
      logEnd('testSmokeReturnsAsyncValue0010');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testSnippetCountFitsComposite0011
     * @tc.name      testSnippetCountFitsComposite0011
     * @tc.desc      Verify the snippet count embedded in the summary parses back to 15
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testSnippetCountFitsComposite0011', 0, () => {
      logBegin('testSnippetCountFitsComposite0011');
      const marker: string = 'snippets=';
      const start: number = smokeResult.indexOf(marker);
      expect(start > 0).assertTrue();
      const tail: string = smokeResult.substring(start + marker.length);
      expect(Number(tail)).assertEqual(15);
      expect(tail.length).assertEqual(2);
      logEnd('testSnippetCountFitsComposite0011');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testCompiledDocsModulesLoaded0012
     * @tc.name      testCompiledDocsModulesLoaded0012
     * @tc.desc      Verify importing CompiledDocs executes all 15 snippet modules without throwing
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testCompiledDocsModulesLoaded0012', 0, () => {
      logBegin('testCompiledDocsModulesLoaded0012');
      let threw: boolean = false;
      let count: number = 0;
      try {
        count = loadCompiledDocSnippets();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(count).assertEqual(15);
      logEnd('testCompiledDocsModulesLoaded0012');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testSmokeHasNoControlCharacters0013
     * @tc.name      testSmokeHasNoControlCharacters0013
     * @tc.desc      Verify the smoke summary contains no newline or tab characters
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testSmokeHasNoControlCharacters0013', 0, () => {
      logBegin('testSmokeHasNoControlCharacters0013');
      expect(smokeResult.indexOf('\n')).assertEqual(-1);
      expect(smokeResult.indexOf('\t')).assertEqual(-1);
      expect(smokeResult.length).assertEqual(50);
      logEnd('testSmokeHasNoControlCharacters0013');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SNIPPET_testSmokeResultLength0014
     * @tc.name      testSmokeResultLength0014
     * @tc.desc      Verify the exact length of the composite summary string
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testSmokeResultLength0014', 0, () => {
      logBegin('testSmokeResultLength0014');
      const expected: string = 'ArkTS Full Language Guide: Alice, 270, snippets=15';
      expect(smokeResult).assertEqual(expected);
      expect(smokeResult.length).assertEqual(expected.length);
      expect(smokeResult.substring(0, 5)).assertEqual('ArkTS');
      expect(smokeResult.substring(smokeResult.length - 3)).assertEqual('=15');
      logEnd('testSmokeResultLength0014');
    });

  });
}
