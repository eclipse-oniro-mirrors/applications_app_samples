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

import { describe, expect, it } from '@ohos/hypium';
import { ON, On, Rect } from '@ohos.UiTest';
import { backTo, click, openFeature, requireComponent, resourceText, withHome } from './Shared/PerformanceDriver';

const HOME: string = 'performanceHome';

async function assertInside(selector: On, outer: Rect): Promise<Rect> {
  const inner = await (await requireComponent(selector)).getBounds();
  const hasArea = inner.right > inner.left && inner.bottom > inner.top;
  const contained = inner.left >= outer.left && inner.top >= outer.top &&
    inner.right <= outer.right && inner.bottom <= outer.bottom;
  expect(hasArea).assertTrue();
  expect(contained).assertTrue();
  return inner;
}

async function verifyWebEntryLayout(id: string): Promise<void> {
  await withHome(async () => {
    const viewport = await (await requireComponent(ON.id(HOME))).getBounds();
    await openFeature('WebPerformance');
    const entry = ON.id(id);
    const other = ON.id(id === 'webRegularEntry' ? 'webOptimizedEntry' : 'webRegularEntry');
    const entryBounds = await assertInside(entry, viewport);
    const otherBounds = await assertInside(other, viewport);
    const separate = entryBounds.bottom <= otherBounds.top || otherBounds.bottom <= entryBounds.top ||
      entryBounds.right <= otherBounds.left || otherBounds.right <= entryBounds.left;
    expect(separate).assertTrue();

    await click(entry);
    await assertInside(ON.id(`${id}Open`), viewport);
    const back = ON.id(`${id}Back`);
    await assertInside(back, viewport);
    await click(back);
    await assertInside(entry, viewport);
  });
}

export default function deviceLayoutTest(): void {
  describe('PerformanceDeviceLayout', () => {
    // @tc.number SUB_PERFORMANCE_DEVICELAYOUT_0100
    // @tc.name regularWebNavigationControlsFitTheCurrentViewport
    // @tc.desc Verify getBounds for regular Web entry and return controls in the current device configuration.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('regularWebNavigationControlsFitTheCurrentViewport', 0, async () => {
      await verifyWebEntryLayout('webRegularEntry');
    });

    // @tc.number SUB_PERFORMANCE_DEVICELAYOUT_0200
    // @tc.name optimizedWebNavigationControlsFitTheCurrentViewport
    // @tc.desc Verify getBounds for optimized Web entry and return controls in the current device configuration.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('optimizedWebNavigationControlsFitTheCurrentViewport', 0, async () => {
      await verifyWebEntryLayout('webOptimizedEntry');
    });

    // @tc.number SUB_PERFORMANCE_DEVICELAYOUT_0300
    // @tc.name backgroundTaskDestinationsHaveNonoverlappingHitAreas
    // @tc.desc Verify getBounds places the transient and long-term task links in separate vertical hit areas.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('backgroundTaskDestinationsHaveNonoverlappingHitAreas', 0, async () => {
      await withHome(async () => {
        const home = ON.id(HOME);
        const viewport = await (await requireComponent(home)).getBounds();
        await openFeature('BackgroundTask');
        const transient = await assertInside(ON.text(resourceText('transient_task')).type('Button'), viewport);
        const longTerm = await assertInside(ON.text(resourceText('long_term_task')).type('Button'), viewport);
        const verticallySeparated = transient.bottom <= longTerm.top;
        expect(verticallySeparated).assertTrue();
        await backTo(home);
      });
    });
  });
}
