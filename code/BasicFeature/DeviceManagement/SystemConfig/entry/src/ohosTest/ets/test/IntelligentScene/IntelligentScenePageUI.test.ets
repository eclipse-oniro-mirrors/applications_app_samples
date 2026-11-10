import { describe, expect, it } from '@ohos/hypium';
import { DoNotDisturbModelJson, DoNotDisturbStatus } from 'library';
import { UiTestSession } from '../Utils/UiTestSupport';

async function openIntelligentScenePage(session: UiTestSession): Promise<void> {
  await session.start();
  await session.openHomeEntry('情景模式', '查询全部状态');
}

async function readDndDetail(session: UiTestSession): Promise<DoNotDisturbModelJson> {
  const detailText: string = await session.scrollTextOf('"queryCount"', true);
  return JSON.parse(detailText) as DoNotDisturbModelJson;
}

/**
 * 情景模式页面加载与初始状态测试。
 * 免打扰查询按钮的页面结果依赖系统通知管理服务，由服务层套件单独覆盖。
 */
export default function intelligentScenePageUITest(): void {
  describe('IntelligentScenePageUITest', () => {
    /**
     * @tc.number: SUB_INTELLIGENT_SCENE_PAGE_UI_0100
     * @tc.name: testIntelligentScenePageUI0001
     * @tc.desc: Verify initial scene values and initialization log.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIntelligentScenePageUI0001', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await openIntelligentScenePage(session);
        expect(await session.scrollTextOf('未启用')).assertEqual('未启用');
        expect(await session.scrollTextOf('允许')).assertEqual('允许');
        expect(await session.scrollTextOf('空闲')).assertEqual('空闲');
        expect(await session.scrollTextOf('视图模型初始化完成', true)).assertContain('视图模型初始化完成');
        const detail: DoNotDisturbModelJson = await readDndDetail(session);
        expect(detail.status).assertEqual(DoNotDisturbStatus.IDLE);
        expect(detail.queryCount).assertEqual(0);
        expect(detail.lastQueryTime).assertEqual(0);
      } finally {
        await session.cleanup();
      }
    });
  });
}
