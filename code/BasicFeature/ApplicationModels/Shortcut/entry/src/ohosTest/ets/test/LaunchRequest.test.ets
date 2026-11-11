import { Want } from '@kit.AbilityKit';
import { describe, expect, it } from '@ohos/hypium';
import { PageKey } from '../../../main/ets/model/ShortcutModels';
import { LaunchRequest, parseLaunchRequest } from '../../../main/ets/navigation/LaunchRequest';
import { runCase } from '../support/CaseScope';

function wantFor(action: string, filter: string, version: string = '1'): Want {
  return { parameters: { 'sc.version': version, 'sc.action': action, 'sc.filter': filter } };
}

export default function launchRequestTests(): void {
  describe('LaunchRequest', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHREQUEST_0100
     * @tc.name      testLaunchRequest0001
     * @tc.desc      Verify launch parameters select pages and reject invalid values
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRequest0001', 0, async (): Promise<void> => {
      await runCase(async (): Promise<void> => {
        const actions: string[] = ['note.new', 'todo.list', 'collection.list'];
        const filters: string[] = ['', 'todayOpen', 'saved'];
        const pages: PageKey[] = [PageKey.NOTE, PageKey.TODO, PageKey.COLLECTION];
        for (const cold of [true, false]) {
          for (let index = 0; index < actions.length; index++) {
            const request: LaunchRequest = parseLaunchRequest(wantFor(actions[index], filters[index]), cold);
            expect(request.page).assertEqual(pages[index]);
            expect(request.source).assertEqual(cold ? '冷启动' : '热启动');
            expect(request.error).assertEqual('');
          }
        }
        const home: Want = {};
        expect(parseLaunchRequest(home, true).page).assertEqual(PageKey.HOME);
        expect(parseLaunchRequest(home, false).error).assertEqual('');
        const note: Want = { parameters: { 'sc.version': '1', 'sc.action': 'note.new' } };
        expect(parseLaunchRequest(note, true).page).assertEqual(PageKey.NOTE);
        const invalid: Want[] = [
          wantFor('note.new', '', '2'),
          wantFor('note.new', '', ''),
          wantFor('unknown', ''),
          wantFor('todo.list', 'saved'),
          wantFor('collection.list', 'todayOpen'),
          wantFor('note.new', 'todayOpen'),
          { parameters: { 'sc.version': 1, 'sc.action': 'note.new' } }
        ];
        for (const want of invalid) {
          const request: LaunchRequest = parseLaunchRequest(want, true);
          expect(request.error.length > 0).assertTrue();
          expect(request.page).assertEqual(PageKey.HOME);
        }
      });
    });
  });
}
