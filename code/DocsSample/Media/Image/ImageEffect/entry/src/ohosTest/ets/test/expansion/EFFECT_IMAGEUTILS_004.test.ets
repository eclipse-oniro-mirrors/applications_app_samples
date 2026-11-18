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
import { expect } from '@ohos/hypium';
import { ImageUtils } from '../../../../main/ets/utils/ImageUtils';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { FixtureScope, decodeResourceReference, normalizePixels } from './fixtures/ImageEffectFixture';
import { assertSize, assertPixelsCloseYielding } from './fixtures/ImageEffectAssertions';
import { CleanupGuard } from './fixtures/ImageEffectCleanup';

/**
 * @tc.number EXP_EFFECT_IMAGEUTILS_004
 * @tc.name EXP_EFFECT_IMAGEUTILS_004
 * @tc.desc ImageUtils真实单例/路径/资源解码接缝; {"method": "getPixelMap", "resource": "app.media.ic_700x700", "expectedSize": [700, 700], "caseId": "EFFECT_IMAGEUTILS_004"}
 * @tc.level Level 1
 * Prerequisite: real HarmonyOS device; serial native calls, no concurrent UI/surface creation.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    const cleanupGuard1 = new CleanupGuard();
    const scope = new FixtureScope(context.cacheDir, 'EFFECT_IMAGEUTILS_004');
    try {
      const resource: Resource = $r('app.media.ic_700x700');
      const reference = scope.ownPixelMap(await decodeResourceReference(context.resourceManager, resource));
      const output = scope.ownPixelMap(await ImageUtils.getInstance().getPixelMap(resource));
      const actual = await normalizePixels(output);
      const expected = await normalizePixels(reference);
      assertSize(actual, 700, 700);
      await assertPixelsCloseYielding(actual, expected, 0);
    } catch (primaryError1) {
      cleanupGuard1.primaryFailed = true;
      throw primaryError1 as Error;
    } finally {
      await cleanupGuard1.run(async (): Promise<void> => {
        await scope.dispose();
      });
    }
  };

export default runExpansionCase;
