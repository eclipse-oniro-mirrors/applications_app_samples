import { describe, expect, it } from '@ohos/hypium';
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import {
  clearSceneWorkbench, getSceneWorkbench, publishSceneWorkbench
} from '../../../main/ets/learning/scene/SceneContext';

function fakeWorkbench(tag: string): SceneWorkbench {
  const raw: string = `{"tag":"${tag}"}`;
  return JSON.parse(raw) as Object as SceneWorkbench;
}

function tagOf(workbench: SceneWorkbench): string {
  return (workbench as Object as Record<string, Object>)['tag'] as string;
}

export default function restoreSceneCasesTest(): void {

  describe('SceneContextCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_SCENECONTEXTCASES_0100
     * @tc.name      testSceneContextCases0001
     * @tc.desc      Verify initial value is undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSceneContextCases0001', 0, (): void => {
      clearSceneWorkbench();
      expect(getSceneWorkbench() === undefined).assertTrue();
      clearSceneWorkbench();
      expect(getSceneWorkbench() === undefined).assertTrue();
      publishSceneWorkbench(fakeWorkbench('probe'));
      expect(getSceneWorkbench() === undefined).assertFalse();
      clearSceneWorkbench();
      expect(getSceneWorkbench() === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENECONTEXTCASES_0200
     * @tc.name      testSceneContextCases0002
     * @tc.desc      Verify publish returns same reference
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSceneContextCases0002', 0, (): void => {
      const workbench: SceneWorkbench = fakeWorkbench('alpha');
      publishSceneWorkbench(workbench);
      const current: SceneWorkbench | undefined = getSceneWorkbench();
      expect(current === workbench).assertTrue();
      expect(current !== undefined).assertTrue();
      expect(tagOf(current as SceneWorkbench)).assertEqual('alpha');
      clearSceneWorkbench();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENECONTEXTCASES_0300
     * @tc.name      testSceneContextCases0003
     * @tc.desc      Verify publish overwrites previous
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSceneContextCases0003', 0, (): void => {
      publishSceneWorkbench(fakeWorkbench('first'));
      const second: SceneWorkbench = fakeWorkbench('second');
      publishSceneWorkbench(second);
      const current: SceneWorkbench | undefined = getSceneWorkbench();
      expect(current === second).assertTrue();
      expect(tagOf(current as SceneWorkbench)).assertEqual('second');
      expect(tagOf(current as SceneWorkbench) === 'first').assertFalse();
      clearSceneWorkbench();
      expect(getSceneWorkbench() === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENECONTEXTCASES_0400
     * @tc.name      testSceneContextCases0004
     * @tc.desc      Verify clear resets to undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSceneContextCases0004', 0, (): void => {
      publishSceneWorkbench(fakeWorkbench('pending'));
      expect(getSceneWorkbench() !== undefined).assertTrue();
      clearSceneWorkbench();
      expect(getSceneWorkbench() === undefined).assertTrue();
      expect(getSceneWorkbench() === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENECONTEXTCASES_0500
     * @tc.name      testSceneContextCases0005
     * @tc.desc      Verify state is module singleton
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSceneContextCases0005', 0, (): void => {
      const workbench: SceneWorkbench = fakeWorkbench('shared');
      publishSceneWorkbench(workbench);
      const first: SceneWorkbench | undefined = getSceneWorkbench();
      const second: SceneWorkbench | undefined = getSceneWorkbench();
      expect(first === second).assertTrue();
      expect(first === workbench).assertTrue();
      expect(tagOf(first as SceneWorkbench)).assertEqual('shared');
      clearSceneWorkbench();
    });
  });
}
