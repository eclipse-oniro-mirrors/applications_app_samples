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

import { describe, it } from '@ohos/hypium';
import { ON, On } from '@ohos.UiTest';
import { backTo, click, expectPresence, openFeature, requireComponent, resourceText, withHome }
  from './Shared/PerformanceDriver';

async function verifyToggle(entryName: string, toggle: On, target: On, initiallyVisible: boolean): Promise<void> {
  await withHome(async () => {
    await openFeature('IfOrVisibility');
    const entry: On = ON.text(resourceText(entryName));
    await click(entry);
    await requireComponent(toggle, 12000);
    await expectPresence(target, initiallyVisible, 'initial rendering');
    await click(toggle);
    await expectPresence(target, !initiallyVisible, 'toggled rendering');
    await click(toggle);
    await expectPresence(target, initiallyVisible, 'restored rendering');
    await backTo(entry);
  });
}

async function verifyGridJump(entry: string, button: string): Promise<void> {
  await withHome(async () => {
    await openFeature('Grid');
    await click(ON.id(entry));
    const target: On = ON.text('1901');
    await requireComponent(ON.id(button));
    await expectPresence(target, false, 'target not initially in viewport');
    await click(ON.id(button));
    await requireComponent(target);
    await backTo(ON.id(entry));
  });
}

export default function renderingTest(): void {
  describe('PerformanceRendering', () => {
    /**
     * @tc.number SUB_PERFORMANCE_RENDERING_0100
     * @tc.name frequentVisibilityTogglesImageSubtree
     * @tc.desc Frequent Visibility Toggles Image Subtree.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('frequentVisibilityTogglesImageSubtree', 0, async () => {
      await verifyToggle('animate_better_use_visibility', ON.text(resourceText('switch_button_text')),
        ON.type('Image'), true);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RENDERING_0200
     * @tc.name frequentConditionalRenderingTogglesImageSubtree
     * @tc.desc Frequent Conditional Rendering Toggles Image Subtree.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('frequentConditionalRenderingTogglesImageSubtree', 0, async () => {
      await verifyToggle('animate_worse_use_if', ON.text(resourceText('switch_button_text')),
        ON.type('Image'), true);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RENDERING_0300
     * @tc.name startupConditionalRenderingShowsInitiallyAbsentList
     * @tc.desc Startup Conditional Rendering Shows Initially Absent List.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('startupConditionalRenderingShowsInitiallyAbsentList', 0, async () => {
      await verifyToggle('start_better_use_if', ON.text(resourceText('reveal_the_hidden')),
        ON.text('Item value: 0'), false);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RENDERING_0400
     * @tc.name startupVisibilityShowsInitiallyHiddenList
     * @tc.desc Startup Visibility Shows Initially Hidden List.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('startupVisibilityShowsInitiallyHiddenList', 0, async () => {
      await verifyToggle('start_worse_use_visibility', ON.text(resourceText('reveal_the_hidden')),
        ON.text('Item value: 0'), false);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RENDERING_0500
     * @tc.name partialUpdateWithStackRestoresTheConditionalRow
     * @tc.desc Partial Update With Stack Restores The Conditional Row.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('partialUpdateWithStackRestoresTheConditionalRow', 0, async () => {
      await verifyToggle('better_use_stack', ON.text('Switch Hidden and Show'), ON.text('New item'), true);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RENDERING_0600
     * @tc.name partialUpdateWithoutStackRestoresTheConditionalRow
     * @tc.desc Partial Update Without Stack Restores The Conditional Row.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('partialUpdateWithoutStackRestoresTheConditionalRow', 0, async () => {
      await verifyToggle('worse_not_use_stack', ON.text('Switch Hidden and Show'), ON.text('New item'), true);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RENDERING_0900
     * @tc.name hiDumperComponentTreeContainsTheDemoGrid
     * @tc.desc Hi Dumper Component Tree Contains The Demo Grid.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('hiDumperComponentTreeContainsTheDemoGrid', 0, async () => {
      await withHome(async () => {
        await openFeature('HiDumper');
        const entry: On = ON.text(resourceText('check_component_tree'));
        await click(entry);
        await requireComponent(ON.id('ID_GRID'));
        await backTo(entry);
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_RENDERING_1000
     * @tc.name hiDumperConditionalRenderingRemovesAndRecreatesTheRow
     * @tc.desc Hi Dumper Conditional Rendering Removes And Recreates The Row.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('hiDumperConditionalRenderingRemovesAndRecreatesTheRow', 0, async () => {
      await withHome(async () => {
        await openFeature('HiDumper');
        await click(ON.text(resourceText('check_if_else_component')));
        const row = ON.id('hiDumperConditionalRow');
        const toggle = ON.text(resourceText('showChange'));
        await requireComponent(row);
        await click(toggle);
        await expectPresence(row, false, 'conditional row removed');
        await click(toggle);
        await requireComponent(row);
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_RENDERING_1100
     * @tc.name hiDumperHiddenRowCanBeMadeVisibleAgain
     * @tc.desc Hi Dumper Hidden Row Can Be Made Visible Again.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('hiDumperHiddenRowCanBeMadeVisibleAgain', 0, async () => {
      await withHome(async () => {
        await openFeature('HiDumper');
        await click(ON.text(resourceText('check_visibility')));
        const row = ON.id('hiDumperVisibilityRow');
        await requireComponent(row);
        await click(ON.text(resourceText('hidden')));
        await expectPresence(row, false, 'hidden row excluded from visible components');
        await click(ON.text(resourceText('visible')));
        await requireComponent(row);
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_RENDERING_1200
     * @tc.name hiDumperNoneRowCanBeMadeVisibleAgain
     * @tc.desc Hi Dumper None Row Can Be Made Visible Again.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('hiDumperNoneRowCanBeMadeVisibleAgain', 0, async () => {
      await withHome(async () => {
        await openFeature('HiDumper');
        await click(ON.text(resourceText('check_visibility')));
        const row = ON.id('hiDumperVisibilityRow');
        await requireComponent(row);
        await click(ON.text(resourceText('none')));
        await expectPresence(row, false, 'none row removed from visible components');
        await click(ON.text(resourceText('visible')));
        await requireComponent(row);
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_RENDERING_1500
     * @tc.name layoutOptionsGridJumpsToRequestedItem
     * @tc.desc Layout Options Grid Jumps To Requested Item.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('layoutOptionsGridJumpsToRequestedItem', 0, async () => {
      await verifyGridJump('buttonThree', 'scrollToIndexTwoBtn');
    });

    /**
     * @tc.number SUB_PERFORMANCE_RENDERING_1600
     * @tc.name smartPerfEditorRendersAndRemovesImage
     * @tc.desc Smart Perf Editor Renders And Removes Image.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('smartPerfEditorRendersAndRemovesImage', 0, async () => {
      await withHome(async () => {
        await openFeature('SmartPerf Editor');
        const toggle: On = ON.id('showImageBtn');
        await requireComponent(toggle);
        await expectPresence(ON.type('Image'), false, 'initial editor image');
        await click(toggle);
        await requireComponent(ON.type('Image'));
        await click(toggle);
        await expectPresence(ON.type('Image'), false, 'removed editor image');
      });
    });
  });
}
