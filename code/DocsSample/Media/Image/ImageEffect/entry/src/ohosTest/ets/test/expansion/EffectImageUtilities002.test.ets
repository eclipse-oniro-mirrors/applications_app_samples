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
import { FixtureSpec, FixtureScope, decodeFileReference, normalizePixels } from './fixtures/ImageEffectFixture';
import { assertSize, assertPixelsClose } from './fixtures/ImageEffectAssertions';
import { CleanupGuard } from './fixtures/ImageEffectCleanup';

/**
 * @tc.number EXP_EFFECT_IMAGEUTILS_002
 * @tc.name EXP_EFFECT_IMAGEUTILS_002
 * @tc.desc ImageUtils真实单例/路径/资源解码接缝; {"method": "getPixelMapByFilePath", "fixture": {"id": "pngOdd", "format": "image/png", "width": 17, "height": 13, "pattern": "opaque-color-quadrants"}, "expectedSize": [17, 13], "caseId": "EFFECT_IMAGEUTILS_002"}
 * @tc.level Level 1
 * Use a physical test device. Call native APIs serially; do not create UI or render targets concurrently.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    const cleanupGuard1 = new CleanupGuard();
    const scope = new FixtureScope(context.cacheDir, 'EFFECT_IMAGEUTILS_002');
    try {
      const spec = new FixtureSpec(17, 13, 'opaque-color-quadrants', 'image/png', [128, 128, 128, 255], [0,
        64, 128, 255], 100);
      const file = await scope.createFile(spec, 'input.png');
      const reference = scope.ownPixelMap(await decodeFileReference(file.originalPath));
      const original = await normalizePixels(reference);
      assertSize(original, 17, 13);
      const output = scope.ownPixelMap(await ImageUtils.getInstance().getPixelMapByFilePath(file.path));
      const actual = await normalizePixels(output);
      assertSize(actual, 17, 13);
      assertPixelsClose(actual, original, 0);
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
