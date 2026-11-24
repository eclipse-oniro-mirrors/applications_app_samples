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

import { describe, beforeAll, it, afterEach, expect } from '@ohos/hypium';
import { yieldToEventLoop } from '../Shared/TestDriver';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { LiveCenter, LiveRoom } from '../Shared/ShopModel';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

function roomOf(id: number, viewers: number, goodsId: number, live: boolean): LiveRoom {
  return new LiveRoom(id, 'room ' + id.toString(), 'anchor-' + id.toString(), viewers,
    goodsId, live);
}

/** Rooms with 520/1200/9800/75/15300 viewers; ids 2 and 4 offline. */
function mixedCenter(): LiveCenter {
  let rooms: LiveRoom[] = [];
  rooms.push(roomOf(0, 520, 10, true));
  rooms.push(roomOf(1, 1200, 11, true));
  rooms.push(roomOf(2, 9800, 12, false));
  rooms.push(roomOf(3, 75, 13, true));
  rooms.push(roomOf(4, 15300, 14, false));
  return new LiveCenter(rooms);
}

function roomIds(rooms: LiveRoom[]): number[] {
  let ids: number[] = [];
  for (let cursor: number = 0; cursor < rooms.length; cursor++) {
    ids.push(rooms[cursor].id);
  }
  return ids;
}

export default function liveCenterTest() {
  describe('OrangeShoppingLiveCenter', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'live center suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0010
     * @tc.name      live_center_live_filter_keeps_only_live_rooms_001
     * @tc.desc      Verify live center live filter keeps only live rooms.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_filter_keeps_only_live_rooms_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_filter_keeps_only_live_rooms_001');
      let center: LiveCenter = mixedCenter();
      let live: LiveRoom[] = center.liveRooms();
      expect(live.length).assertEqual(3);
      for (let cursor: number = 0; cursor < live.length; cursor++) {
        expect(live[cursor].live).assertTrue();
      }
      expect(center.all().length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0020
     * @tc.name      live_center_live_filter_preserves_order_002
     * @tc.desc      Verify live center live filter preserves order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_filter_preserves_order_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_filter_preserves_order_002');
      let center: LiveCenter = mixedCenter();
      let live: LiveRoom[] = center.liveRooms();
      expect(live.length).assertEqual(3);
      expect(live[0].id).assertEqual(0);
      expect(live[1].id).assertEqual(1);
      expect(live[2].id).assertEqual(3);
      let __seen149: number[] = [];
      for (let __i149: number = 0; __i149 < (roomIds(live)).length; __i149++) {
        expect(__seen149.indexOf((roomIds(live))[__i149]) < 0).assertTrue();
        __seen149.push((roomIds(live))[__i149]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0030
     * @tc.name      live_center_live_filter_excludes_offline_room_003
     * @tc.desc      Verify live center live filter excludes offline room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_filter_excludes_offline_room_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_filter_excludes_offline_room_003');
      let center: LiveCenter = mixedCenter();
      let live: LiveRoom[] = center.liveRooms();
      let ids: number[] = roomIds(live);
      expect(ids.indexOf(2)).assertEqual(-1);
      expect(ids.indexOf(4)).assertEqual(-1);
      expect(ids.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0040
     * @tc.name      live_center_live_rooms_returns_new_array_004
     * @tc.desc      Verify live center live rooms returns new array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_rooms_returns_new_array_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_rooms_returns_new_array_004');
      let center: LiveCenter = mixedCenter();
      let first: LiveRoom[] = center.liveRooms();
      // The fixed rooms total 520 + 1200 + 9800 + 75 + 15300 = 26895, unaffected by clearing the borrowed list.
      first.splice(0, first.length);
      let second: LiveRoom[] = center.liveRooms();
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(3);
      expect(center.totalViewers()).assertEqual(26895);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0050
     * @tc.name      live_center_live_filter_empty_when_all_offline_005
     * @tc.desc      Verify live center live filter empty when all offline.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_filter_empty_when_all_offline_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_filter_empty_when_all_offline_005');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 100, 10, false));
      rooms.push(roomOf(1, 200, 11, false));
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.liveRooms().length).assertEqual(0);
      expect(center.liveRooms().length).assertEqual(0);
      expect(center.totalViewers()).assertEqual(300);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0060
     * @tc.name      live_center_live_filter_single_live_room_006
     * @tc.desc      Verify live center live filter single live room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_filter_single_live_room_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_filter_single_live_room_006');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(7, 640, 20, true));
      let center: LiveCenter = new LiveCenter(rooms);
      let live: LiveRoom[] = center.liveRooms();
      expect(live.length).assertEqual(1);
      expect(live[0].id).assertEqual(7);
      expect(live[0].live).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0070
     * @tc.name      live_center_live_filter_reflects_room_going_offline_007
     * @tc.desc      Verify live center live filter reflects room going offline.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_filter_reflects_room_going_offline_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_filter_reflects_room_going_offline_007');
      let center: LiveCenter = mixedCenter();
      expect(center.liveRooms().length).assertEqual(3);
      let room: LiveRoom | undefined = center.byGoods(11);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        room.live = false;
      }
      expect(center.liveRooms().length).assertEqual(2);
      expect(center.totalViewers()).assertEqual(26895);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0080
     * @tc.name      live_center_live_filter_reflects_room_coming_online_008
     * @tc.desc      Verify live center live filter reflects room coming online.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_filter_reflects_room_coming_online_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_filter_reflects_room_coming_online_008');
      let center: LiveCenter = mixedCenter();
      let room: LiveRoom | undefined = center.byGoods(12);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.live).assertFalse();
        room.live = true;
      }
      expect(center.liveRooms().length).assertEqual(4);
      expect(center.liveRooms()[2].id).assertEqual(2);
      expect(center.liveRooms()[3].id).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0090
     * @tc.name      live_center_total_viewers_sums_all_rooms_009
     * @tc.desc      Verify live center total viewers sums all rooms.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_total_viewers_sums_all_rooms_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_total_viewers_sums_all_rooms_009');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 100, 10, true));
      rooms.push(roomOf(1, 200, 11, true));
      rooms.push(roomOf(2, 300, 12, true));
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.totalViewers()).assertEqual(600);
      expect(center.totalViewers()).assertEqual(100 + 200 + 300);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0100
     * @tc.name      live_center_total_viewers_includes_offline_010
     * @tc.desc      Verify live center total viewers includes offline.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_total_viewers_includes_offline_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_total_viewers_includes_offline_010');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 100, 10, true));
      rooms.push(roomOf(1, 500, 11, false));
      let center: LiveCenter = new LiveCenter(rooms);
      // The offline 500 still counts toward the total, so 100 + 500 = 600 sits beside a single live room.
      expect(center.liveRooms().length).assertEqual(1);
      expect(center.totalViewers()).assertEqual(600);
      let room: LiveRoom | undefined = center.byGoods(11);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(1);
        expect(room.live).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0110
     * @tc.name      live_center_total_viewers_empty_is_zero_011
     * @tc.desc      Verify live center total viewers empty is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_total_viewers_empty_is_zero_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_total_viewers_empty_is_zero_011');
      let rooms: LiveRoom[] = [];
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.totalViewers()).assertEqual(0);
      expect(center.all().length).assertEqual(0);
      expect(center.liveRooms().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0120
     * @tc.name      live_center_total_viewers_single_room_012
     * @tc.desc      Verify live center total viewers single room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_total_viewers_single_room_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_total_viewers_single_room_012');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 4321, 10, true));
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.totalViewers()).assertEqual(4321);
      expect(center.all().length).assertEqual(1);
      expect(center.liveRooms().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0130
     * @tc.name      live_center_total_viewers_large_center_013
     * @tc.desc      Verify live center total viewers large center.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_total_viewers_large_center_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_total_viewers_large_center_013');
      let rooms: LiveRoom[] = [];
      for (let cursor: number = 0; cursor < 10; cursor++) {
        rooms.push(roomOf(cursor, 1000, cursor, true));
      }
      let center: LiveCenter = new LiveCenter(rooms);
      // Ten rooms of exactly 1000 viewers give 10000, which is why dividing the total by 1000 returns 10.
      expect(center.totalViewers()).assertEqual(10000);
      expect(center.liveRooms().length).assertEqual(10);
      expect(center.totalViewers() / 1000).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0140
     * @tc.name      live_center_total_viewers_zero_viewer_rooms_014
     * @tc.desc      Verify live center total viewers zero viewer rooms.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_total_viewers_zero_viewer_rooms_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_total_viewers_zero_viewer_rooms_014');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 0, 10, true));
      rooms.push(roomOf(1, 0, 11, false));
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.totalViewers()).assertEqual(0);
      expect(center.liveRooms().length).assertEqual(1);
      expect(center.liveRooms()[0].viewersText()).assertEqual('0');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0150
     * @tc.name      live_center_total_viewers_reflects_viewer_change_015
     * @tc.desc      Verify live center total viewers reflects viewer change.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_total_viewers_reflects_viewer_change_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_total_viewers_reflects_viewer_change_015');
      let center: LiveCenter = mixedCenter();
      expect(center.totalViewers()).assertEqual(26895);
      let room: LiveRoom | undefined = center.byGoods(10);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        // Raising room 0 from 520 to 1520 adds 1000, yet the 15300 in room 4 remains the maximum.
        room.viewers = 1520;
      }
      expect(center.totalViewers()).assertEqual(27895);
      let most: LiveRoom | undefined = center.mostWatched();
      expect(most !== null && most !== undefined).assertTrue();
      if (most !== undefined) {
        expect(most.id).assertEqual(4);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0160
     * @tc.name      live_center_total_viewers_after_removing_room_from_all_016
     * @tc.desc      Verify live center total viewers after removing room from all.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_total_viewers_after_removing_room_from_all_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_total_viewers_after_removing_room_from_all_016');
      let center: LiveCenter = mixedCenter();
      expect(center.totalViewers()).assertEqual(26895);
      let all: LiveRoom[] = center.all();
      // Removing the first room drops its 520 viewers, taking the total from 26895 to 26375.
      all.splice(0, 1);
      expect(center.all().length).assertEqual(4);
      expect(center.totalViewers()).assertEqual(26375);
      expect(center.byGoods(10) === null || center.byGoods(10) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0170
     * @tc.name      live_center_by_goods_finds_matching_room_017
     * @tc.desc      Verify live center by goods finds matching room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_by_goods_finds_matching_room_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_by_goods_finds_matching_room_017');
      let center: LiveCenter = mixedCenter();
      let room: LiveRoom | undefined = center.byGoods(13);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(3);
        expect(room.goodsId).assertEqual(13);
        expect(room.viewers).assertEqual(75);
        expect(room.live).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0180
     * @tc.name      live_center_by_goods_returns_room_fields_018
     * @tc.desc      Verify live center by goods returns room fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_by_goods_returns_room_fields_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_by_goods_returns_room_fields_018');
      let center: LiveCenter = mixedCenter();
      let room: LiveRoom | undefined = center.byGoods(10);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.anchor).assertEqual('anchor-0');
        expect(room.title).assertEqual('room 0');
        expect(room.viewers).assertEqual(520);
        expect(room.live).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0190
     * @tc.name      live_center_by_goods_finds_offline_room_019
     * @tc.desc      Verify live center by goods finds offline room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_by_goods_finds_offline_room_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_by_goods_finds_offline_room_019');
      let center: LiveCenter = mixedCenter();
      let room: LiveRoom | undefined = center.byGoods(12);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.live).assertFalse();
        expect(room.id).assertEqual(2);
        expect(room.viewers).assertEqual(9800);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0200
     * @tc.name      live_center_by_goods_unknown_returns_undefined_020
     * @tc.desc      Verify live center by goods unknown returns undefined.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_by_goods_unknown_returns_undefined_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_by_goods_unknown_returns_undefined_020');
      let center: LiveCenter = mixedCenter();
      expect(center.byGoods(99) === null || center.byGoods(99) === undefined).assertTrue();
      expect(center.byGoods(100) === null || center.byGoods(100) === undefined).assertTrue();
      expect(center.byGoods(10) !== null && center.byGoods(10) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0210
     * @tc.name      live_center_by_goods_negative_returns_undefined_021
     * @tc.desc      Verify live center by goods negative returns undefined.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_by_goods_negative_returns_undefined_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_by_goods_negative_returns_undefined_021');
      let center: LiveCenter = mixedCenter();
      expect(center.byGoods(-1) === null || center.byGoods(-1) === undefined).assertTrue();
      expect(center.byGoods(-10) === null || center.byGoods(-10) === undefined).assertTrue();
      expect(center.all().length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0220
     * @tc.name      live_center_by_goods_duplicate_returns_first_022
     * @tc.desc      Verify live center by goods duplicate returns first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_by_goods_duplicate_returns_first_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_by_goods_duplicate_returns_first_022');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 100, 42, true));
      rooms.push(roomOf(1, 900, 42, true));
      let center: LiveCenter = new LiveCenter(rooms);
      // Two rooms share goods 42; the lookup stops at the first 100-viewer row while the total adds both to 1000.
      let room: LiveRoom | undefined = center.byGoods(42);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(0);
        expect(room.viewers).assertEqual(100);
      }
      expect(center.totalViewers()).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0230
     * @tc.name      live_center_by_goods_zero_id_023
     * @tc.desc      Verify live center by goods zero id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_by_goods_zero_id_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_by_goods_zero_id_023');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(5, 300, 0, true));
      let center: LiveCenter = new LiveCenter(rooms);
      let room: LiveRoom | undefined = center.byGoods(0);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(5);
        expect(room.goodsId).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0240
     * @tc.name      live_center_by_goods_empty_center_024
     * @tc.desc      Verify live center by goods empty center.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_by_goods_empty_center_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_by_goods_empty_center_024');
      let rooms: LiveRoom[] = [];
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.byGoods(0) === null || center.byGoods(0) === undefined).assertTrue();
      expect(center.byGoods(10) === null || center.byGoods(10) === undefined).assertTrue();
      expect(center.all().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0250
     * @tc.name      live_center_by_goods_does_not_match_room_id_025
     * @tc.desc      Verify live center by goods does not match room id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_by_goods_does_not_match_room_id_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_by_goods_does_not_match_room_id_025');
      let center: LiveCenter = mixedCenter();
      expect(center.byGoods(0) === null || center.byGoods(0) === undefined).assertTrue();
      expect(center.byGoods(3) === null || center.byGoods(3) === undefined).assertTrue();
      expect(center.byGoods(10) !== null && center.byGoods(10) !== undefined).assertTrue();
      expect(center.all()[0].id).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0260
     * @tc.name      live_center_duplicate_goods_both_count_in_total_026
     * @tc.desc      Verify live center duplicate goods both count in total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_duplicate_goods_both_count_in_total_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_duplicate_goods_both_count_in_total_026');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 100, 42, true));
      rooms.push(roomOf(1, 900, 42, true));
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.totalViewers()).assertEqual(1000);
      expect(center.liveRooms().length).assertEqual(2);
      let found: LiveRoom | undefined = center.byGoods(42);
      expect(found !== null && found !== undefined).assertTrue();
      if (found !== undefined) {
        expect(found.id).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0270
     * @tc.name      live_center_most_watched_returns_highest_027
     * @tc.desc      Verify live center most watched returns highest.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_most_watched_returns_highest_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_most_watched_returns_highest_027');
      let center: LiveCenter = mixedCenter();
      let room: LiveRoom | undefined = center.mostWatched();
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(4);
        expect(room.viewers).assertEqual(15300);
        expect(room.goodsId).assertEqual(14);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0280
     * @tc.name      live_center_most_watched_tie_returns_first_028
     * @tc.desc      Verify live center most watched tie returns first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_most_watched_tie_returns_first_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_most_watched_tie_returns_first_028');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 700, 10, true));
      rooms.push(roomOf(1, 700, 11, true));
      let center: LiveCenter = new LiveCenter(rooms);
      // Both rooms report 700 viewers, and the scan keeps the earlier row, so room 0 wins the tie.
      let room: LiveRoom | undefined = center.mostWatched();
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(0);
        expect(room.viewers).assertEqual(700);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0290
     * @tc.name      live_center_most_watched_single_room_029
     * @tc.desc      Verify live center most watched single room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_most_watched_single_room_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_most_watched_single_room_029');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(9, 321, 10, true));
      let center: LiveCenter = new LiveCenter(rooms);
      let room: LiveRoom | undefined = center.mostWatched();
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(9);
        expect(room.viewers).assertEqual(321);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0300
     * @tc.name      live_center_most_watched_empty_returns_undefined_030
     * @tc.desc      Verify live center most watched empty returns undefined.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_most_watched_empty_returns_undefined_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_most_watched_empty_returns_undefined_030');
      let rooms: LiveRoom[] = [];
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.mostWatched() === null || center.mostWatched() === undefined).assertTrue();
      expect(center.totalViewers()).assertEqual(0);
      expect(center.liveRooms().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0310
     * @tc.name      live_center_most_watched_can_be_offline_031
     * @tc.desc      Verify live center most watched can be offline.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_most_watched_can_be_offline_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_most_watched_can_be_offline_031');
      let rooms: LiveRoom[] = [];
      // The most-watched scan ignores the live flag, so the offline 9000-viewer room outranks the live 100.
      rooms.push(roomOf(0, 100, 10, true));
      rooms.push(roomOf(1, 9000, 11, false));
      let center: LiveCenter = new LiveCenter(rooms);
      let room: LiveRoom | undefined = center.mostWatched();
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(1);
        expect(room.live).assertFalse();
      }
      expect(center.liveRooms().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0320
     * @tc.name      live_center_most_watched_when_highest_is_first_032
     * @tc.desc      Verify live center most watched when highest is first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_most_watched_when_highest_is_first_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_most_watched_when_highest_is_first_032');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 9000, 10, true));
      rooms.push(roomOf(1, 100, 11, true));
      rooms.push(roomOf(2, 200, 12, true));
      let center: LiveCenter = new LiveCenter(rooms);
      let room: LiveRoom | undefined = center.mostWatched();
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(0);
        expect(room.viewers).assertEqual(9000);
      }
      expect(center.totalViewers()).assertEqual(9300);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0330
     * @tc.name      live_center_most_watched_all_zero_returns_first_033
     * @tc.desc      Verify live center most watched all zero returns first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_most_watched_all_zero_returns_first_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_most_watched_all_zero_returns_first_033');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 0, 10, true));
      rooms.push(roomOf(1, 0, 11, true));
      let center: LiveCenter = new LiveCenter(rooms);
      let room: LiveRoom | undefined = center.mostWatched();
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(0);
        expect(room.viewers).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0340
     * @tc.name      live_center_most_watched_reflects_viewer_change_034
     * @tc.desc      Verify live center most watched reflects viewer change.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_most_watched_reflects_viewer_change_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_most_watched_reflects_viewer_change_034');
      let center: LiveCenter = mixedCenter();
      let first: LiveRoom | undefined = center.mostWatched();

      expect(first !== null && first !== undefined).assertTrue();
      if (first !== undefined) {
        expect(first.id).assertEqual(4);
      }
      let room: LiveRoom | undefined = center.byGoods(10);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        room.viewers = 20000;
      }
      let next: LiveRoom | undefined = center.mostWatched();
      expect(next !== null && next !== undefined).assertTrue();
      if (next !== undefined) {
        expect(next.id).assertEqual(0);
        expect(next.viewers).assertEqual(20000);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0350
     * @tc.name      live_center_viewers_text_does_not_depend_on_live_flag_035
     * @tc.desc      Verify live center viewers text does not depend on live flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_viewers_text_does_not_depend_on_live_flag_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_viewers_text_does_not_depend_on_live_flag_035');
      let offline: LiveRoom = roomOf(0, 12345, 10, false);
      let online: LiveRoom = roomOf(1, 12345, 11, true);
      // viewersText reads only the 12345 count, so the offline and live copies both render 1.2w.
      expect(offline.viewersText()).assertEqual('1.2w');
      expect(online.viewersText()).assertEqual('1.2w');
      expect(offline.live).assertFalse();
      expect(online.live).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0360
     * @tc.name      live_center_viewers_text_of_listed_room_036
     * @tc.desc      Verify live center viewers text of listed room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_viewers_text_of_listed_room_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_viewers_text_of_listed_room_036');
      let center: LiveCenter = mixedCenter();
      let room: LiveRoom | undefined = center.byGoods(14);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.viewersText()).assertEqual('1.5w');
        expect(room.viewersText()).assertEqual(roomOf(4, 15300, 14, false).viewersText());
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0370
     * @tc.name      live_center_single_room_contract_037
     * @tc.desc      Verify live center single room contract.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_single_room_contract_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_single_room_contract_037');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 888, 10, true));
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.all().length).assertEqual(1);
      expect(center.liveRooms().length).assertEqual(1);
      expect(center.totalViewers()).assertEqual(888);
      let byGoods: LiveRoom | undefined = center.byGoods(10);
      expect(byGoods !== null && byGoods !== undefined).assertTrue();
      let mostWatched: LiveRoom | undefined = center.mostWatched();
      expect(mostWatched !== null && mostWatched !== undefined).assertTrue();
      if (byGoods !== undefined && mostWatched !== undefined) {
        expect(byGoods.id).assertEqual(mostWatched.id);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0380
     * @tc.name      live_center_empty_answers_all_queries_038
     * @tc.desc      Verify live center empty answers all queries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_empty_answers_all_queries_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_empty_answers_all_queries_038');
      let rooms: LiveRoom[] = [];
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.all().length).assertEqual(0);
      expect(center.liveRooms().length).assertEqual(0);
      expect(center.totalViewers()).assertEqual(0);
      expect(center.byGoods(10) === null || center.byGoods(10) === undefined).assertTrue();
      expect(center.mostWatched() === null || center.mostWatched() === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0390
     * @tc.name      live_center_copies_the_input_array_039
     * @tc.desc      Verify live center copies the input array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_copies_the_input_array_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_copies_the_input_array_039');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 100, 10, true));
      rooms.push(roomOf(1, 200, 11, true));
      let center: LiveCenter = new LiveCenter(rooms);
      rooms.push(roomOf(2, 900, 12, true));
      expect(rooms.length).assertEqual(3);
      expect(center.all().length).assertEqual(2);
      expect(center.totalViewers()).assertEqual(300);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0400
     * @tc.name      live_center_non_live_room_absent_from_live_list_but_in_all_040
     * @tc.desc      Verify live center non live room absent from live list but in all.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_non_live_room_absent_from_live_list_but_in_all_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_non_live_room_absent_from_live_list_but_in_all_040');
      let center: LiveCenter = mixedCenter();
      let all: LiveRoom[] = center.all();
      let live: LiveRoom[] = center.liveRooms();
      expect(all.length).assertEqual(5);
      expect(live.length).assertEqual(3);
      expect(roomIds(live).indexOf(4)).assertEqual(-1);
      expect(roomIds(all).indexOf(4)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0410
     * @tc.name      live_center_live_filter_ignores_viewer_count_041
     * @tc.desc      Verify live center live filter ignores viewer count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_filter_ignores_viewer_count_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_filter_ignores_viewer_count_041');
      let rooms: LiveRoom[] = [];
      // A zero-viewer live room survives the filter while the 100000-viewer offline room is dropped.
      rooms.push(roomOf(0, 0, 10, true));
      rooms.push(roomOf(1, 100000, 11, false));
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.liveRooms().length).assertEqual(1);
      expect(center.liveRooms()[0].id).assertEqual(0);
      expect(center.totalViewers()).assertEqual(100000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0420
     * @tc.name      live_center_total_viewers_after_live_toggle_042
     * @tc.desc      Verify live center total viewers after live toggle.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_total_viewers_after_live_toggle_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_total_viewers_after_live_toggle_042');
      let center: LiveCenter = mixedCenter();
      let before: number = center.totalViewers();
      let room: LiveRoom | undefined = center.byGoods(11);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        room.live = false;
      }
      expect(center.totalViewers()).assertEqual(before);
      expect(center.liveRooms().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0430
     * @tc.name      live_center_most_watched_after_live_toggle_043
     * @tc.desc      Verify live center most watched after live toggle.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_most_watched_after_live_toggle_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_most_watched_after_live_toggle_043');
      let center: LiveCenter = mixedCenter();
      let room: LiveRoom | undefined = center.byGoods(14);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.live).assertFalse();
        room.live = true;
      }
      let mostWatched: LiveRoom | undefined = center.mostWatched();
      expect(mostWatched !== null && mostWatched !== undefined).assertTrue();
      if (mostWatched !== undefined) {
        expect(mostWatched.id).assertEqual(4);
        expect(mostWatched.viewers).assertEqual(15300);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0440
     * @tc.name      live_center_room_ids_are_unique_044
     * @tc.desc      Verify live center room ids are unique.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_room_ids_are_unique_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_room_ids_are_unique_044');
      let center: LiveCenter = mixedCenter();
      let ids: number[] = roomIds(center.all());
      expect(ids.length).assertEqual(5);
      let __seen150: number[] = [];
      for (let __i150: number = 0; __i150 < (ids).length; __i150++) {
        expect(__seen150.indexOf((ids)[__i150]) < 0).assertTrue();
        __seen150.push((ids)[__i150]);
      }
      expect(ids[0]).assertEqual(0);
      expect(ids[4]).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0450
     * @tc.name      live_center_all_entries_keep_their_live_flags_045
     * @tc.desc      Verify live center all entries keep their live flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_all_entries_keep_their_live_flags_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_all_entries_keep_their_live_flags_045');
      let center: LiveCenter = mixedCenter();
      let all: LiveRoom[] = center.all();
      // The five mixed rooms carry live flags 1, 1, 0, 1, 0 in the order they were supplied.
      let expected: number[] = [1, 1, 0, 1, 0];
      expect(all.length).assertEqual(5);
      for (let cursor: number = 0; cursor < all.length; cursor++) {
        expect(all[cursor].live ? 1 : 0).assertEqual(expected[cursor]);
      }
      expect(all[2].id).assertEqual(2);
      expect(all[4].id).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0460
     * @tc.name      live_center_live_filter_does_not_mutate_all_046
     * @tc.desc      Verify live center live filter does not mutate all.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_filter_does_not_mutate_all_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_filter_does_not_mutate_all_046');
      let center: LiveCenter = mixedCenter();
      let before: number[] = roomIds(center.all());
      let live: LiveRoom[] = center.liveRooms();
      let after: number[] = roomIds(center.all());
      expect((after).length).assertEqual((before).length);
      for (let __i148: number = 0; __i148 < (before).length; __i148++) {
        expect((after)[__i148]).assertEqual((before)[__i148]);
      }
      expect(after.length).assertEqual(5);
      expect(live.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0470
     * @tc.name      live_center_total_viewers_repeated_calls_are_stable_047
     * @tc.desc      Verify live center total viewers repeated calls are stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_total_viewers_repeated_calls_are_stable_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_total_viewers_repeated_calls_are_stable_047');
      let center: LiveCenter = mixedCenter();
      let first: number = center.totalViewers();
      let second: number = center.totalViewers();
      expect(first).assertEqual(second);
      expect(first).assertEqual(26895);
      expect(center.all().length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0480
     * @tc.name      live_center_by_goods_after_first_duplicate_removed_048
     * @tc.desc      Verify live center by goods after first duplicate removed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_by_goods_after_first_duplicate_removed_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_by_goods_after_first_duplicate_removed_048');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 100, 42, true));
      rooms.push(roomOf(1, 900, 42, true));
      let center: LiveCenter = new LiveCenter(rooms);
      let all: LiveRoom[] = center.all();
      all.splice(0, 1);
      let room: LiveRoom | undefined = center.byGoods(42);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(1);
        expect(room.viewers).assertEqual(900);
      }
      expect(center.totalViewers()).assertEqual(900);
      expect(center.all().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0490
     * @tc.name      live_center_most_watched_with_only_offline_rooms_049
     * @tc.desc      Verify live center most watched with only offline rooms.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_most_watched_with_only_offline_rooms_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_most_watched_with_only_offline_rooms_049');
      let rooms: LiveRoom[] = [];
      // With every room offline the most-watched scan still runs, picking the 500-viewer room 1.
      rooms.push(roomOf(0, 100, 10, false));
      rooms.push(roomOf(1, 500, 11, false));
      let center: LiveCenter = new LiveCenter(rooms);
      let room: LiveRoom | undefined = center.mostWatched();
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(1);
        expect(room.viewers).assertEqual(500);
        expect(room.live).assertFalse();
      }
      expect(center.liveRooms().length).assertEqual(0);
      expect(center.totalViewers()).assertEqual(600);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0500
     * @tc.name      live_center_live_rooms_share_instances_with_all_050
     * @tc.desc      Verify live center live rooms share instances with all.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_rooms_share_instances_with_all_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_rooms_share_instances_with_all_050');
      let center: LiveCenter = mixedCenter();
      let live: LiveRoom[] = center.liveRooms();
      live[0].viewers = 777;
      let all: LiveRoom[] = center.all();
      expect(all[0].viewers).assertEqual(777);
      let room: LiveRoom | undefined = center.byGoods(10);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.viewers).assertEqual(777);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0510
     * @tc.name      live_center_single_offline_room_051
     * @tc.desc      Verify live center single offline room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_single_offline_room_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_single_offline_room_051');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 300, 10, false));
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.all().length).assertEqual(1);
      expect(center.liveRooms().length).assertEqual(0);
      expect(center.totalViewers()).assertEqual(300);
      expect(center.byGoods(10) !== null && center.byGoods(10) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0520
     * @tc.name      live_center_most_watched_single_offline_room_052
     * @tc.desc      Verify live center most watched single offline room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_most_watched_single_offline_room_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_most_watched_single_offline_room_052');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 300, 10, false));
      let center: LiveCenter = new LiveCenter(rooms);
      let room: LiveRoom | undefined = center.mostWatched();
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(0);
        expect(room.live).assertFalse();
        expect(room.viewers).assertEqual(300);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0530
     * @tc.name      live_center_by_goods_after_goods_id_change_053
     * @tc.desc      Verify live center by goods after goods id change.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_by_goods_after_goods_id_change_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_by_goods_after_goods_id_change_053');
      let center: LiveCenter = mixedCenter();
      let room: LiveRoom | undefined = center.byGoods(10);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        // byGoods reads the live goods id per call, so moving room 0 to goods 99 makes id 10 miss.
        room.goodsId = 99;
      }
      expect(center.byGoods(10) === null || center.byGoods(10) === undefined).assertTrue();
      let moved: LiveRoom | undefined = center.byGoods(99);
      expect(moved !== null && moved !== undefined).assertTrue();
      if (moved !== undefined) {
        expect(moved.id).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0540
     * @tc.name      live_center_live_filter_count_matches_manual_scan_054
     * @tc.desc      Verify live center live filter count matches manual scan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_filter_count_matches_manual_scan_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_filter_count_matches_manual_scan_054');
      let center: LiveCenter = mixedCenter();
      let all: LiveRoom[] = center.all();
      let expected: number = 0;
      for (let cursor: number = 0; cursor < all.length; cursor++) {
        if (all[cursor].live) {
          expected++;
        }
      }
      expect(expected).assertEqual(3);
      expect(center.liveRooms().length).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0550
     * @tc.name      live_center_total_viewers_after_appending_room_to_all_055
     * @tc.desc      Verify live center total viewers after appending room to all.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_total_viewers_after_appending_room_to_all_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_total_viewers_after_appending_room_to_all_055');
      let center: LiveCenter = mixedCenter();
      expect(center.totalViewers()).assertEqual(26895);
      let all: LiveRoom[] = center.all();
      // Appending a 105-viewer live room raises the total to 27000 and the live count to 4.
      all.push(roomOf(5, 105, 15, true));
      expect(center.all().length).assertEqual(6);
      expect(center.totalViewers()).assertEqual(27000);
      expect(center.liveRooms().length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0560
     * @tc.name      live_center_most_watched_after_removing_highest_056
     * @tc.desc      Verify live center most watched after removing highest.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_most_watched_after_removing_highest_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_most_watched_after_removing_highest_056');
      let center: LiveCenter = mixedCenter();
      let before: LiveRoom | undefined = center.mostWatched();

      expect(before !== null && before !== undefined).assertTrue();
      if (before !== undefined) {
        expect(before.id).assertEqual(4);
      }
      let all: LiveRoom[] = center.all();
      // Removing the index-4 room drops its 15300 viewers, making the 9800 room 2 the new maximum.
      all.splice(4, 1);
      let room: LiveRoom | undefined = center.mostWatched();
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(2);
        expect(room.viewers).assertEqual(9800);
      }
      expect(center.totalViewers()).assertEqual(11595);
      expect(center.all().length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0570
     * @tc.name      live_center_by_goods_three_duplicates_returns_first_057
     * @tc.desc      Verify live center by goods three duplicates returns first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_by_goods_three_duplicates_returns_first_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_by_goods_three_duplicates_returns_first_057');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 100, 42, true));
      rooms.push(roomOf(1, 900, 42, true));
      rooms.push(roomOf(2, 500, 42, true));
      let center: LiveCenter = new LiveCenter(rooms);
      // Three rooms share goods 42; the first 100-viewer row is returned while the total adds 100 + 900 + 500.
      let room: LiveRoom | undefined = center.byGoods(42);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(0);
        expect(room.viewers).assertEqual(100);
      }
      expect(center.totalViewers()).assertEqual(1500);
      expect(center.liveRooms().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0580
     * @tc.name      live_center_live_filter_excludes_offline_first_room_058
     * @tc.desc      Verify live center live filter excludes offline first room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_center_live_filter_excludes_offline_first_room_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_center_live_filter_excludes_offline_first_room_058');
      let rooms: LiveRoom[] = [];
      rooms.push(roomOf(0, 9000, 10, false));
      rooms.push(roomOf(1, 100, 11, true));
      rooms.push(roomOf(2, 200, 12, true));
      let center: LiveCenter = new LiveCenter(rooms);
      let live: LiveRoom[] = center.liveRooms();
      // The 9000-viewer room 0 is offline, so it vanishes from the live list yet still joins the 9300 total.
      expect(live.length).assertEqual(2);
      expect(live[0].id).assertEqual(1);
      expect(live[1].id).assertEqual(2);
      expect(roomIds(live).indexOf(0)).assertEqual(-1);
      expect(center.totalViewers()).assertEqual(9300);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0590
     * @tc.name      live_viewers_below_one_thousand_render_the_raw_count_059
     * @tc.desc      Verify live viewers below one thousand render the raw count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_viewers_below_one_thousand_render_the_raw_count_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_viewers_below_one_thousand_render_the_raw_count_059');
      let counts: number[] = [0, 1, 75, 999];
      expect(counts.length).assertEqual(4);
      // Anything under 1000 prints unchanged, so 999 stays 999 while the next test's 1000 becomes 1k.
      for (let index: number = 0; index < counts.length; index++) {
        let room: LiveRoom = roomOf(index, counts[index], 10 + index, true);
        expect(room.viewersText()).assertEqual(counts[index].toString());
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_LIVE_CENTER_0600
     * @tc.name      live_viewers_render_compact_k_and_w_branches_060
     * @tc.desc      Verify live viewers render compact k and w branches.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_viewers_render_compact_k_and_w_branches_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_viewers_render_compact_k_and_w_branches_060');
      let counts: number[][] = [
        [1000, 1001, 1500, 1999, 9000, 9999],
        [10000, 10001, 11000, 15300, 19999, 20000]
      ];
      let texts: string[][] = [
        ['1k', '1k', '1.5k', '1.9k', '9k', '9.9k'],
        ['1w', '1w', '1.1w', '1.5w', '1.9w', '2w']
      ];
      let suffixes: string[] = ['k', 'w'];

      expect(counts.length).assertEqual(suffixes.length);
      // The compact form keeps one decimal and truncates, so 1500 renders 1.5k and 1999 renders 1.9k.
      for (let row: number = 0; row < counts.length; row++) {
        for (let column: number = 0; column < counts[row].length; column++) {
          let room: LiveRoom = roomOf(row * 10 + column, counts[row][column],
            20 + row * 10 + column, true);
          let text: string = room.viewersText();
          expect(text).assertEqual(texts[row][column]);
          expect(text.charAt(text.length - 1)).assertEqual(suffixes[row]);
        }
      }
    });

  });
}
