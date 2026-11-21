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
import { Coupon, UserAccount } from '../Shared/ShopModel';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Empty wallet, so couponCount stays clear of points and level. */
function accountOf(nickname: string, points: number, level: number): UserAccount {
  let coupons: Coupon[] = [];
  return new UserAccount(nickname, points, level, coupons);
}

/** Level 1 and zero points, so counts stay clear of the wallet size. */
function accountWithCoupons(nickname: string, coupons: Coupon[]): UserAccount {
  return new UserAccount(nickname, 0, 1, coupons);
}

/** No spending threshold and a fixed 100-cent discount. */
function couponOf(id: string): Coupon {
  return new Coupon(id, 'coupon ' + id, 0, 100);
}

export default function userAccountTest() {
  describe('OrangeShoppingUserAccount', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'user account suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0010
     * @tc.name      user_account_defaults_are_empty_001
     * @tc.desc      Verify user account defaults are empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_defaults_are_empty_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_defaults_are_empty_001');
      let account: UserAccount = new UserAccount('fresh');
      expect(account.nickname).assertEqual('fresh');
      expect(account.points).assertEqual(0);
      expect(account.level).assertEqual(1);
      expect(account.couponCount()).assertEqual(0);
      expect(account.pointsValue().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0020
     * @tc.name      user_account_keeps_initial_points_002
     * @tc.desc      Verify user account keeps initial points.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_keeps_initial_points_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_keeps_initial_points_002');
      let account: UserAccount = new UserAccount('shopper', 1500, 3);
      expect(account.points).assertEqual(1500);
      expect(account.level).assertEqual(3);
      expect(account.pointsValue().cents()).assertEqual(1500);
      expect(account.levelName()).assertEqual('gold');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0030
     * @tc.name      user_account_keeps_initial_level_without_points_003
     * @tc.desc      Verify user account keeps initial level without points.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_keeps_initial_level_without_points_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_keeps_initial_level_without_points_003');
      let account: UserAccount = new UserAccount('diamond', 0, 5);
      expect(account.points).assertEqual(0);
      expect(account.level).assertEqual(5);
      expect(account.levelName()).assertEqual('diamond');
      expect(account.pointsValue().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0040
     * @tc.name      user_account_points_value_is_zero_below_one_hundred_004
     * @tc.desc      Verify user account points value is zero below one hundred.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_points_value_is_zero_below_one_hundred_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_points_value_is_zero_below_one_hundred_004');
      // Every balance below 100 floors to zero whole yuan, including 99.
      let points: number[] = [0, 1, 49, 50, 99];
      for (let cursor: number = 0; cursor < points.length; cursor++) {
        let account: UserAccount = accountOf('floor', points[cursor], 1);
        expect(account.pointsValue().cents()).assertEqual(0);
        expect(account.pointsValue().format()).assertEqual('¥0.00');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0050
     * @tc.name      user_account_add_after_failed_redeem_crosses_boundary_005
     * @tc.desc      Verify user account add after failed redeem crosses boundary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_add_after_failed_redeem_crosses_boundary_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_add_after_failed_redeem_crosses_boundary_005');
      let account: UserAccount = accountOf('shopper', 50, 1);
      // The rejected redeem keeps all 50 points, so the later +50 lands exactly on the 100 boundary.
      expect(account.redeem(100)).assertFalse();
      expect(account.pointsValue().cents()).assertEqual(0);
      expect(account.addPoints(50)).assertEqual(100);
      expect(account.pointsValue().cents()).assertEqual(100);
      expect(account.pointsValue().format()).assertEqual('¥1.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0060
     * @tc.name      user_account_points_value_floors_partial_hundreds_006
     * @tc.desc      Verify user account points value floors partial hundreds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_points_value_floors_partial_hundreds_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_points_value_floors_partial_hundreds_006');
      let points: number[] = [101, 150, 199, 250, 299];
      // floor(points / 100) * 100 cents: 199 still reports 100 and 299 still reports 200.
      let expected: number[] = [100, 100, 100, 200, 200];
      for (let cursor: number = 0; cursor < points.length; cursor++) {
        let account: UserAccount = accountOf('floor', points[cursor], 1);
        expect(account.pointsValue().cents()).assertEqual(expected[cursor]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0070
     * @tc.name      user_account_points_value_floors_large_balance_007
     * @tc.desc      Verify user account points value floors large balance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_points_value_floors_large_balance_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_points_value_floors_large_balance_007');
      // 15350 floors to 153 whole yuan, discarding the 50 leftover points.
      let account: UserAccount = accountOf('rich', 15350, 4);
      expect(account.pointsValue().cents()).assertEqual(15300);
      expect(account.pointsValue().cents() / 100).assertEqual(153);
      expect(account.pointsValue().format()).assertEqual('¥153.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0080
     * @tc.name      user_account_points_value_ignores_level_008
     * @tc.desc      Verify user account points value ignores level.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_points_value_ignores_level_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_points_value_ignores_level_008');
      let low: UserAccount = accountOf('low', 250, 1);
      let high: UserAccount = accountOf('high', 250, 5);
      expect(low.pointsValue().cents()).assertEqual(200);
      expect(high.pointsValue().cents()).assertEqual(200);
      expect(low.pointsValue().cents()).assertEqual(high.pointsValue().cents());
      expect(low.levelName()).assertEqual('bronze');
      expect(high.levelName()).assertEqual('diamond');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0090
     * @tc.name      user_account_add_points_applies_only_positive_deltas_009
     * @tc.desc      Verify user account add points applies only positive deltas.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_add_points_applies_only_positive_deltas_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_add_points_applies_only_positive_deltas_009');
      // Zero and negative deltas are ignored, so only the +500 row moves the balance.
      let starts: number[] = [1500, 1500, 1500];
      let deltas: number[] = [500, 0, -250];
      let balances: number[] = [2000, 1500, 1500];
      expect(deltas.length).assertEqual(balances.length);
      for (let index: number = 0; index < deltas.length; index++) {
        let account: UserAccount = accountOf('shopper', starts[index], 3);
        let balance: number = account.addPoints(deltas[index]);
        expect(balance).assertEqual(balances[index]);
        expect(account.points).assertEqual(balances[index]);
        expect(account.pointsValue().cents()).assertEqual(balances[index]);
        expect(account.levelName()).assertEqual('gold');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0100
     * @tc.name      user_account_add_points_accumulates_across_calls_010
     * @tc.desc      Verify user account add points accumulates across calls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_add_points_accumulates_across_calls_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_add_points_accumulates_across_calls_010');
      let account: UserAccount = accountOf('shopper', 100, 2);
      // Three successive adds build 100 → 150 → 175 → 200, so the balance persists between calls.
      expect(account.addPoints(50)).assertEqual(150);
      expect(account.addPoints(25)).assertEqual(175);
      expect(account.addPoints(25)).assertEqual(200);
      expect(account.points).assertEqual(200);
      expect(account.pointsValue().cents()).assertEqual(200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0110
     * @tc.name      user_account_add_points_crosses_hundred_boundary_011
     * @tc.desc      Verify user account add points crosses hundred boundary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_add_points_crosses_hundred_boundary_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_add_points_crosses_hundred_boundary_011');
      // 99 points pay nothing, and one more point crosses into ¥1.00 at 100 cents.
      let account: UserAccount = accountOf('boundary', 99, 1);
      expect(account.pointsValue().cents()).assertEqual(0);
      let balance: number = account.addPoints(1);
      expect(balance).assertEqual(100);
      expect(account.pointsValue().cents()).assertEqual(100);
      expect(account.pointsValue().format()).assertEqual('¥1.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0120
     * @tc.name      user_account_add_two_steps_below_hundred_stays_zero_012
     * @tc.desc      Verify user account add two steps below hundred stays zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_add_two_steps_below_hundred_stays_zero_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_add_two_steps_below_hundred_stays_zero_012');
      let account: UserAccount = accountOf('boundary', 0, 1);
      expect(account.addPoints(25)).assertEqual(25);
      expect(account.addPoints(25)).assertEqual(50);
      expect(account.points).assertEqual(50);
      expect(account.pointsValue().cents()).assertEqual(0);
      expect(account.pointsValue().format()).assertEqual('¥0.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0130
     * @tc.name      user_account_add_points_does_not_change_level_013
     * @tc.desc      Verify user account add points does not change level.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_add_points_does_not_change_level_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_add_points_does_not_change_level_013');
      let account: UserAccount = accountOf('shopper', 0, 2);
      // Level is independent of the balance, so +5000 leaves the level-2 silver name unchanged.
      account.addPoints(5000);
      expect(account.level).assertEqual(2);
      expect(account.levelName()).assertEqual('silver');
      expect(account.points).assertEqual(5000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0140
     * @tc.name      user_account_coupon_count_counts_empty_id_coupon_014
     * @tc.desc      Verify user account coupon count counts empty id coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_coupon_count_counts_empty_id_coupon_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_coupon_count_counts_empty_id_coupon_014');
      let coupons: Coupon[] = [];
      coupons.push(couponOf(''));
      let account: UserAccount = accountWithCoupons('shopper', coupons);
      expect(account.couponCount()).assertEqual(1);
      expect(account.coupons[0].id).assertEqual('');
      account.addPoints(100);
      expect(account.couponCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0150
     * @tc.name      user_account_add_points_returns_the_stored_balance_015
     * @tc.desc      Verify user account add points returns the stored balance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_add_points_returns_the_stored_balance_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_add_points_returns_the_stored_balance_015');
      let account: UserAccount = accountOf('shopper', 40, 2);
      let returned: number = account.addPoints(60);
      expect(returned).assertEqual(account.points);
      expect(returned).assertEqual(100);
      expect(account.pointsValue().cents()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0160
     * @tc.name      user_account_redeem_exact_balance_succeeds_016
     * @tc.desc      Verify user account redeem exact balance succeeds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_exact_balance_succeeds_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_exact_balance_succeeds_016');
      let account: UserAccount = accountOf('shopper', 500, 3);
      let redeemed: boolean = account.redeem(500);
      expect(redeemed).assertTrue();
      expect(account.points).assertEqual(0);
      expect(account.pointsValue().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0170
     * @tc.name      user_account_redeem_partial_leaves_remainder_017
     * @tc.desc      Verify user account redeem partial leaves remainder.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_partial_leaves_remainder_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_partial_leaves_remainder_017');
      let starts: number[] = [500, 355];
      let amounts: number[] = [200, 55];
      let remainders: number[] = [300, 300];
      expect(starts.length).assertEqual(remainders.length);
      for (let index: number = 0; index < starts.length; index++) {
        let account: UserAccount = accountOf('shopper', starts[index], 3);
        let redeemed: boolean = account.redeem(amounts[index]);
        expect(redeemed).assertTrue();
        expect(account.points).assertEqual(remainders[index]);
        expect(account.pointsValue().cents()).assertEqual(remainders[index]);
        expect(account.pointsValue().format()).assertEqual('¥3.00');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0180
     * @tc.name      user_account_redeem_zero_returns_false_018
     * @tc.desc      Verify user account redeem zero returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_zero_returns_false_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_zero_returns_false_018');
      let account: UserAccount = accountOf('shopper', 500, 3);
      let redeemed: boolean = account.redeem(0);
      expect(redeemed).assertFalse();
      expect(account.points).assertEqual(500);
      expect(account.pointsValue().cents()).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0190
     * @tc.name      user_account_redeem_negative_returns_false_019
     * @tc.desc      Verify user account redeem negative returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_negative_returns_false_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_negative_returns_false_019');
      let account: UserAccount = accountOf('shopper', 500, 3);
      let redeemed: boolean = account.redeem(-100);
      expect(redeemed).assertFalse();
      expect(account.points).assertEqual(500);
      expect(account.pointsValue().cents()).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0200
     * @tc.name      user_account_redeem_failure_keeps_balance_020
     * @tc.desc      Verify user account redeem failure keeps balance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_failure_keeps_balance_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_failure_keeps_balance_020');
      let account: UserAccount = accountOf('shopper', 250, 2);
      let before: number = account.points;
      let beforeValue: number = account.pointsValue().cents();
      let redeemed: boolean = account.redeem(400);
      expect(redeemed).assertFalse();
      expect(account.points).assertEqual(before);
      expect(account.pointsValue().cents()).assertEqual(beforeValue);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0210
     * @tc.name      user_account_redeem_after_failure_with_smaller_amount_021
     * @tc.desc      Verify user account redeem after failure with smaller amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_after_failure_with_smaller_amount_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_after_failure_with_smaller_amount_021');
      let account: UserAccount = accountOf('shopper', 250, 2);
      let failed: boolean = account.redeem(400);
      expect(failed).assertFalse();
      expect(account.points).assertEqual(250);
      let succeeded: boolean = account.redeem(150);
      expect(succeeded).assertTrue();
      expect(account.points).assertEqual(100);
      expect(account.pointsValue().cents()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0220
     * @tc.name      user_account_redeem_does_not_change_coupons_022
     * @tc.desc      Verify user account redeem does not change coupons.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_does_not_change_coupons_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_does_not_change_coupons_022');
      let coupons: Coupon[] = [];
      coupons.push(couponOf('C10'));
      let account: UserAccount = new UserAccount('shopper', 500, 3, coupons);
      let redeemed: boolean = account.redeem(500);
      expect(redeemed).assertTrue();
      expect(account.couponCount()).assertEqual(1);
      expect(account.coupons[0].id).assertEqual('C10');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0230
     * @tc.name      user_account_redeem_below_hundred_drops_value_023
     * @tc.desc      Verify user account redeem below hundred drops value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_below_hundred_drops_value_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_below_hundred_drops_value_023');
      let account: UserAccount = accountOf('shopper', 150, 1);
      // Redeeming 100 drops the balance to 50, below the threshold, so the value becomes zero.
      expect(account.pointsValue().cents()).assertEqual(100);
      let redeemed: boolean = account.redeem(100);
      expect(redeemed).assertTrue();
      expect(account.points).assertEqual(50);
      expect(account.pointsValue().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0240
     * @tc.name      user_account_redeem_does_not_allow_overdraft_024
     * @tc.desc      Verify user account redeem does not allow overdraft.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_does_not_allow_overdraft_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_does_not_allow_overdraft_024');
      let account: UserAccount = accountOf('shopper', 40, 1);
      let redeemed: boolean = account.redeem(41);
      expect(redeemed).assertFalse();
      expect(account.points).assertEqual(40);
      expect(account.redeem(40)).assertTrue();
      expect(account.points).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0250
     * @tc.name      user_account_redeem_one_point_balance_025
     * @tc.desc      Verify user account redeem one point balance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_one_point_balance_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_one_point_balance_025');
      let account: UserAccount = accountOf('shopper', 1, 1);
      expect(account.redeem(1)).assertTrue();
      expect(account.points).assertEqual(0);
      expect(account.redeem(1)).assertFalse();
      expect(account.points).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0260
     * @tc.name      user_account_second_redeem_after_exhausting_fails_026
     * @tc.desc      Verify user account second redeem after exhausting fails.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_second_redeem_after_exhausting_fails_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_second_redeem_after_exhausting_fails_026');
      let account: UserAccount = accountOf('shopper', 300, 2);
      expect(account.redeem(300)).assertTrue();
      let second: boolean = account.redeem(1);
      expect(second).assertFalse();
      expect(account.points).assertEqual(0);
      expect(account.pointsValue().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0270
     * @tc.name      user_account_redeem_returns_true_only_on_success_027
     * @tc.desc      Verify user account redeem returns true only on success.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_returns_true_only_on_success_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_returns_true_only_on_success_027');
      let account: UserAccount = accountOf('shopper', 100, 1);
      expect(account.redeem(0)).assertFalse();
      expect(account.redeem(101)).assertFalse();
      expect(account.redeem(60)).assertTrue();
      expect(account.points).assertEqual(40);
      expect(account.pointsValue().cents()).assertEqual(0);
      expect(account.pointsValue().format()).assertEqual('¥0.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0280
     * @tc.name      user_account_level_one_is_bronze_028
     * @tc.desc      Verify user account level one is bronze.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_level_one_is_bronze_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_level_one_is_bronze_028');
      let account: UserAccount = accountOf('level', 0, 1);
      expect(account.levelName()).assertEqual('bronze');
      expect(account.level).assertEqual(1);
      expect(account.points).assertEqual(0);
      expect(account.pointsValue().cents()).assertEqual(0);
      account.addPoints(500);
      expect(account.levelName()).assertEqual('bronze');
      expect(account.level).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0290
     * @tc.name      user_account_level_two_is_silver_029
     * @tc.desc      Verify user account level two is silver.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_level_two_is_silver_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_level_two_is_silver_029');
      let account: UserAccount = accountOf('level', 200, 2);
      expect(account.levelName()).assertEqual('silver');
      expect(account.level).assertEqual(2);
      expect(account.pointsValue().cents()).assertEqual(200);
      expect(account.redeem(100)).assertTrue();
      expect(account.levelName()).assertEqual('silver');
      expect(account.points).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0300
     * @tc.name      user_account_level_bands_group_three_to_six_030
     * @tc.desc      Verify user account level bands group three to six.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_level_bands_group_three_to_six_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_level_bands_group_three_to_six_030');
      // levelName uses >= cutoffs: 3 and 4 are gold, 5 and 6 are diamond.
      let levels: number[] = [3, 4, 5, 6];
      let names: string[] = ['gold', 'gold', 'diamond', 'diamond'];
      expect(levels.length).assertEqual(names.length);
      for (let cursor: number = 0; cursor < levels.length; cursor++) {
        let account: UserAccount = accountOf('level', 0, levels[cursor]);
        expect(account.levelName()).assertEqual(names[cursor]);
        expect(account.level).assertEqual(levels[cursor]);
        expect(account.points).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0310
     * @tc.name      user_account_level_zero_and_negative_are_bronze_031
     * @tc.desc      Verify user account level zero and negative are bronze.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_level_zero_and_negative_are_bronze_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_level_zero_and_negative_are_bronze_031');
      // Anything below 2, including negative levels, falls through to bronze.
      let levels: number[] = [0, -1, -5];
      for (let cursor: number = 0; cursor < levels.length; cursor++) {
        let account: UserAccount = accountOf('level', 0, levels[cursor]);
        expect(account.levelName()).assertEqual('bronze');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0320
     * @tc.name      user_account_level_above_six_stays_diamond_032
     * @tc.desc      Verify user account level above six stays diamond.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_level_above_six_stays_diamond_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_level_above_six_stays_diamond_032');
      let account: UserAccount = accountOf('level', 0, 10);
      expect(account.levelName()).assertEqual('diamond');
      expect(account.level).assertEqual(10);
      expect(accountOf('level', 0, 6).levelName()).assertEqual('diamond');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0330
     * @tc.name      user_account_level_name_is_independent_of_points_033
     * @tc.desc      Verify user account level name is independent of points.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_level_name_is_independent_of_points_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_level_name_is_independent_of_points_033');
      let diamond: UserAccount = accountOf('rich', 0, 5);
      let bronze: UserAccount = accountOf('rich', 10000, 1);
      expect(diamond.levelName()).assertEqual('diamond');
      expect(bronze.levelName()).assertEqual('bronze');
      expect(diamond.pointsValue().cents()).assertEqual(0);
      expect(bronze.pointsValue().cents()).assertEqual(10000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0340
     * @tc.name      user_account_coupon_count_empty_wallet_034
     * @tc.desc      Verify user account coupon count empty wallet.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_coupon_count_empty_wallet_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_coupon_count_empty_wallet_034');
      let account: UserAccount = accountOf('shopper', 0, 1);
      expect(account.couponCount()).assertEqual(0);
      expect(account.coupons.length).assertEqual(0);
      expect(account.coupons.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0350
     * @tc.name      user_account_coupon_count_with_three_coupons_035
     * @tc.desc      Verify user account coupon count with three coupons.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_coupon_count_with_three_coupons_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_coupon_count_with_three_coupons_035');
      let coupons: Coupon[] = [];
      coupons.push(couponOf('C10'));
      coupons.push(couponOf('C20'));
      coupons.push(couponOf('C50'));
      let account: UserAccount = accountWithCoupons('shopper', coupons);
      expect(account.couponCount()).assertEqual(3);
      expect(account.coupons.length).assertEqual(3);
      expect(account.coupons[2].id).assertEqual('C50');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0360
     * @tc.name      user_account_coupon_count_after_adding_coupon_036
     * @tc.desc      Verify user account coupon count after adding coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_coupon_count_after_adding_coupon_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_coupon_count_after_adding_coupon_036');
      let account: UserAccount = accountOf('shopper', 0, 1);
      expect(account.couponCount()).assertEqual(0);
      account.coupons.push(couponOf('C10'));
      expect(account.couponCount()).assertEqual(1);
      account.coupons.push(couponOf('C20'));
      expect(account.couponCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0370
     * @tc.name      user_account_coupon_count_after_removing_coupon_037
     * @tc.desc      Verify user account coupon count after removing coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_coupon_count_after_removing_coupon_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_coupon_count_after_removing_coupon_037');
      let coupons: Coupon[] = [];
      coupons.push(couponOf('C10'));
      coupons.push(couponOf('C20'));
      let account: UserAccount = accountWithCoupons('shopper', coupons);
      expect(account.couponCount()).assertEqual(2);
      account.coupons.splice(0, 1);
      expect(account.couponCount()).assertEqual(1);
      expect(account.coupons[0].id).assertEqual('C20');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0380
     * @tc.name      user_account_coupon_count_does_not_change_with_points_038
     * @tc.desc      Verify user account coupon count does not change with points.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_coupon_count_does_not_change_with_points_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_coupon_count_does_not_change_with_points_038');
      let coupons: Coupon[] = [];
      coupons.push(couponOf('C10'));
      let account: UserAccount = new UserAccount('shopper', 0, 1, coupons);
      account.addPoints(500);
      expect(account.couponCount()).assertEqual(1);
      account.redeem(200);
      expect(account.couponCount()).assertEqual(1);
      expect(account.points).assertEqual(300);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0390
     * @tc.name      user_account_nickname_is_preserved_039
     * @tc.desc      Verify user account nickname is preserved.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_nickname_is_preserved_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_nickname_is_preserved_039');
      let account: UserAccount = accountOf('Alice', 0, 1);
      expect(account.nickname).assertEqual('Alice');
      expect(account.nickname.length).assertEqual(5);
      account.addPoints(100);
      expect(account.nickname).assertEqual('Alice');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0400
     * @tc.name      user_account_nickname_can_change_040
     * @tc.desc      Verify user account nickname can change.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_nickname_can_change_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_nickname_can_change_040');
      let account: UserAccount = accountOf('Alice', 0, 1);
      account.nickname = 'Bob';
      expect(account.nickname).assertEqual('Bob');
      expect(account.nickname.length).assertEqual(3);
      expect(account.levelName()).assertEqual('bronze');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0410
     * @tc.name      user_accounts_have_independent_points_041
     * @tc.desc      Verify user accounts have independent points.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_accounts_have_independent_points_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_accounts_have_independent_points_041');
      let first: UserAccount = accountOf('first', 100, 1);
      let second: UserAccount = accountOf('second', 100, 1);
      first.addPoints(400);
      expect(first.points).assertEqual(500);
      expect(second.points).assertEqual(100);
      second.redeem(100);
      expect(second.points).assertEqual(0);
      expect(first.points).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0420
     * @tc.name      user_accounts_have_independent_coupon_wallets_042
     * @tc.desc      Verify user accounts have independent coupon wallets.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_accounts_have_independent_coupon_wallets_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_accounts_have_independent_coupon_wallets_042');
      let first: UserAccount = accountOf('first', 0, 1);
      let second: UserAccount = accountOf('second', 0, 1);
      first.coupons.push(couponOf('C10'));
      expect(first.couponCount()).assertEqual(1);
      expect(second.couponCount()).assertEqual(0);
      second.coupons.push(couponOf('C20'));
      second.coupons.push(couponOf('C50'));
      expect(second.couponCount()).assertEqual(2);
      expect(first.couponCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0430
     * @tc.name      user_accounts_with_same_nickname_are_independent_043
     * @tc.desc      Verify user accounts with same nickname are independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_accounts_with_same_nickname_are_independent_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_accounts_with_same_nickname_are_independent_043');
      let first: UserAccount = accountOf('shopper', 0, 1);
      let second: UserAccount = accountOf('shopper', 0, 1);
      first.addPoints(300);
      expect(first.nickname).assertEqual(second.nickname);
      expect(first.points).assertEqual(300);
      expect(second.points).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0440
     * @tc.name      user_account_new_accounts_have_independent_nicknames_044
     * @tc.desc      Verify user account new accounts have independent nicknames.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_new_accounts_have_independent_nicknames_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_new_accounts_have_independent_nicknames_044');
      let first: UserAccount = new UserAccount('first');
      let second: UserAccount = new UserAccount('second');
      expect(first.nickname).assertEqual('first');
      expect(second.nickname).assertEqual('second');
      first.nickname = 'renamed';
      expect(first.nickname).assertEqual('renamed');
      expect(second.nickname).assertEqual('second');
      expect(second.points).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0450
     * @tc.name      user_account_add_then_redeem_round_trip_045
     * @tc.desc      Verify user account add then redeem round trip.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_add_then_redeem_round_trip_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_add_then_redeem_round_trip_045');
      let account: UserAccount = accountOf('shopper', 100, 2);
      expect(account.addPoints(50)).assertEqual(150);
      expect(account.redeem(120)).assertTrue();
      expect(account.points).assertEqual(30);
      expect(account.pointsValue().cents()).assertEqual(0);
      expect(account.level).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0460
     * @tc.name      user_account_redeem_below_hundred_keeps_level_and_nickname_046
     * @tc.desc      Verify user account redeem below hundred keeps level and nickname.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_below_hundred_keeps_level_and_nickname_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_below_hundred_keeps_level_and_nickname_046');
      let account: UserAccount = accountOf('shopper', 250, 3);
      expect(account.redeem(200)).assertTrue();
      expect(account.points).assertEqual(50);
      expect(account.pointsValue().cents()).assertEqual(0);
      expect(account.level).assertEqual(3);
      expect(account.levelName()).assertEqual('gold');
      expect(account.nickname).assertEqual('shopper');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0470
     * @tc.name      user_account_points_values_are_independent_after_redeem_047
     * @tc.desc      Verify user account points values are independent after redeem.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_points_values_are_independent_after_redeem_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_points_values_are_independent_after_redeem_047');
      let first: UserAccount = accountOf('first', 500, 1);
      let second: UserAccount = accountOf('second', 500, 1);
      expect(first.redeem(200)).assertTrue();
      expect(first.pointsValue().cents()).assertEqual(300);
      expect(second.pointsValue().cents()).assertEqual(500);
      expect(second.redeem(100)).assertTrue();
      expect(first.pointsValue().cents()).assertEqual(300);
      expect(second.pointsValue().cents()).assertEqual(400);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0480
     * @tc.name      user_account_points_value_whole_yuan_sweep_048
     * @tc.desc      Verify user account points value whole yuan sweep.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_points_value_whole_yuan_sweep_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_points_value_whole_yuan_sweep_048');
      let points: number[] = [100, 200, 300, 1000, 10000];
      for (let cursor: number = 0; cursor < points.length; cursor++) {
        let account: UserAccount = accountOf('whole', points[cursor], 1);
        expect(account.pointsValue().cents()).assertEqual(points[cursor]);
        expect(account.pointsValue().cents() % 100).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0490
     * @tc.name      user_account_points_value_nine_thousand_nine_ninety_nine_049
     * @tc.desc      Verify user account points value nine thousand nine ninety nine.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_points_value_nine_thousand_nine_ninety_nine_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_points_value_nine_thousand_nine_ninety_nine_049');
      let account: UserAccount = accountOf('floor', 9999, 2);
      expect(account.pointsValue().cents()).assertEqual(9900);
      expect(account.pointsValue().format()).assertEqual('¥99.00');
      expect(account.points).assertEqual(9999);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0500
     * @tc.name      user_account_add_points_large_amount_050
     * @tc.desc      Verify user account add points large amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_add_points_large_amount_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_add_points_large_amount_050');
      let account: UserAccount = accountOf('rich', 0, 1);
      let balance: number = account.addPoints(1000000);
      expect(balance).assertEqual(1000000);
      expect(account.pointsValue().cents()).assertEqual(1000000);
      expect(account.pointsValue().format()).assertEqual('¥10000.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0510
     * @tc.name      user_account_redeem_all_then_add_again_051
     * @tc.desc      Verify user account redeem all then add again.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_all_then_add_again_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_all_then_add_again_051');
      // Row 1 drains to 0 then gains 50; row 2 keeps 400 then gains 100, so it ends at 500.
      let starts: number[] = [300, 500];
      let redeems: number[] = [300, 100];
      let additions: number[] = [50, 100];
      let expectedPoints: number[] = [50, 500];
      let expectedValue: number[] = [0, 500];
      expect(starts.length).assertEqual(redeems.length);
      for (let index: number = 0; index < starts.length; index++) {
        let account: UserAccount = accountOf('shopper', starts[index], index + 1);
        expect(account.redeem(redeems[index])).assertTrue();
        expect(account.points).assertEqual(starts[index] - redeems[index]);
        expect(account.addPoints(additions[index])).assertEqual(expectedPoints[index]);
        expect(account.pointsValue().cents()).assertEqual(expectedValue[index]);
      }
});

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0520
     * @tc.name      user_account_redeem_failed_then_add_then_succeed_052
     * @tc.desc      Verify user account redeem failed then add then succeed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_failed_then_add_then_succeed_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_failed_then_add_then_succeed_052');
      let account: UserAccount = accountOf('shopper', 250, 1);
      expect(account.redeem(400)).assertFalse();
      expect(account.points).assertEqual(250);
      expect(account.addPoints(200)).assertEqual(450);
      expect(account.redeem(450)).assertTrue();
      expect(account.points).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0530
     * @tc.name      user_account_redeem_partial_twice_053
     * @tc.desc      Verify user account redeem partial twice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_partial_twice_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_partial_twice_053');
      let account: UserAccount = accountOf('shopper', 500, 2);
      // Two partial redeems leave 350 points, which floors to 300 cents.
      expect(account.redeem(100)).assertTrue();
      expect(account.redeem(50)).assertTrue();
      expect(account.points).assertEqual(350);
      expect(account.pointsValue().cents()).assertEqual(300);
      expect(account.pointsValue().format()).assertEqual('¥3.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0540
     * @tc.name      user_account_redeem_exceeding_after_partial_054
     * @tc.desc      Verify user account redeem exceeding after partial.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_exceeding_after_partial_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_exceeding_after_partial_054');
      let account: UserAccount = accountOf('shopper', 500, 2);
      expect(account.redeem(200)).assertTrue();
      expect(account.points).assertEqual(300);
      expect(account.redeem(400)).assertFalse();
      expect(account.points).assertEqual(300);
      expect(account.pointsValue().format()).assertEqual('¥3.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0550
     * @tc.name      user_account_add_points_does_not_change_nickname_055
     * @tc.desc      Verify user account add points does not change nickname.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_add_points_does_not_change_nickname_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_add_points_does_not_change_nickname_055');
      let account: UserAccount = accountOf('Alice', 100, 2);
      account.addPoints(500);
      expect(account.nickname).assertEqual('Alice');
      expect(account.nickname.length).assertEqual(5);
      expect(account.points).assertEqual(600);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0560
     * @tc.name      user_account_redeem_does_not_change_nickname_056
     * @tc.desc      Verify user account redeem does not change nickname.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_does_not_change_nickname_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_does_not_change_nickname_056');
      let account: UserAccount = accountOf('Alice', 500, 2);
      expect(account.redeem(200)).assertTrue();
      expect(account.nickname).assertEqual('Alice');
      expect(account.nickname.length).assertEqual(5);
      expect(account.points).assertEqual(300);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0570
     * @tc.name      user_account_level_change_updates_name_in_both_directions_057
     * @tc.desc      Verify user account level change updates name in both directions.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_level_change_updates_name_in_both_directions_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s',
        'CASE: user_account_level_change_updates_name_in_both_directions_057');
      // Raising level 2 to 5 and lowering level 5 to 1 both re-read the name from the current level.
      let starts: number[] = [2, 5];
      let targets: number[] = [5, 1];
      let beforeNames: string[] = ['silver', 'diamond'];
      let afterNames: string[] = ['diamond', 'bronze'];
      expect(starts.length).assertEqual(afterNames.length);
      for (let index: number = 0; index < starts.length; index++) {
        let account: UserAccount = accountOf('level', 0, starts[index]);
        expect(account.levelName()).assertEqual(beforeNames[index]);
        account.level = targets[index];
        expect(account.levelName()).assertEqual(afterNames[index]);
        expect(account.level).assertEqual(targets[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0580
     * @tc.name      user_account_coupon_order_after_removing_middle_058
     * @tc.desc      Verify user account coupon order after removing middle.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_coupon_order_after_removing_middle_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_coupon_order_after_removing_middle_058');
      let coupons: Coupon[] = [];
      coupons.push(couponOf('C10'));
      coupons.push(couponOf('C20'));
      coupons.push(couponOf('C50'));
      let account: UserAccount = accountWithCoupons('shopper', coupons);
      account.coupons.splice(1, 1);
      expect(account.couponCount()).assertEqual(2);
      expect(account.coupons[0].id).assertEqual('C10');
      expect(account.coupons[1].id).assertEqual('C50');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0590
     * @tc.name      user_account_coupon_count_after_clearing_059
     * @tc.desc      Verify user account coupon count after clearing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_coupon_count_after_clearing_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_coupon_count_after_clearing_059');
      let coupons: Coupon[] = [];
      coupons.push(couponOf('C10'));
      coupons.push(couponOf('C20'));
      let account: UserAccount = accountWithCoupons('shopper', coupons);
      account.coupons.splice(0, account.coupons.length);
      expect(account.couponCount()).assertEqual(0);
      expect(account.coupons.length).assertEqual(0);
      expect(account.level).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0600
     * @tc.name      user_account_coupon_count_keeps_duplicate_ids_060
     * @tc.desc      Verify user account coupon count keeps duplicate ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_coupon_count_keeps_duplicate_ids_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_coupon_count_keeps_duplicate_ids_060');
      let coupons: Coupon[] = [];
      coupons.push(couponOf('C10'));
      coupons.push(couponOf('C10'));
      let account: UserAccount = accountWithCoupons('shopper', coupons);
      expect(account.couponCount()).assertEqual(2);
      expect(account.coupons[0].id).assertEqual('C10');
      expect(account.coupons[1].id).assertEqual('C10');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0610
     * @tc.name      user_account_coupons_can_be_replaced_061
     * @tc.desc      Verify user account coupons can be replaced.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_coupons_can_be_replaced_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_coupons_can_be_replaced_061');
      let coupons: Coupon[] = [];
      coupons.push(couponOf('C10'));
      let account: UserAccount = accountWithCoupons('shopper', coupons);
      expect(account.couponCount()).assertEqual(1);
      let next: Coupon[] = [];
      account.coupons = next;
      expect(account.couponCount()).assertEqual(0);
      expect(account.coupons.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0620
     * @tc.name      user_account_nickname_can_be_empty_062
     * @tc.desc      Verify user account nickname can be empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_nickname_can_be_empty_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_nickname_can_be_empty_062');
      let account: UserAccount = accountOf('', 0, 1);
      expect(account.nickname).assertEqual('');
      expect(account.nickname.length).assertEqual(0);
      expect(account.levelName()).assertEqual('bronze');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0630
     * @tc.name      user_account_nickname_with_spaces_is_preserved_063
     * @tc.desc      Verify user account nickname with spaces is preserved.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_nickname_with_spaces_is_preserved_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_nickname_with_spaces_is_preserved_063');
      let account: UserAccount = accountOf('Alice Smith', 0, 1);
      expect(account.nickname).assertEqual('Alice Smith');
      expect(account.nickname.indexOf(' ')).assertEqual(5);
      expect(account.nickname.length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0640
     * @tc.name      user_account_default_coupons_are_not_shared_064
     * @tc.desc      Verify user account default coupons are not shared.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_default_coupons_are_not_shared_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_default_coupons_are_not_shared_064');
      let first: UserAccount = new UserAccount('first');
      let second: UserAccount = new UserAccount('second');
      first.coupons.push(couponOf('C10'));
      expect(first.couponCount()).assertEqual(1);
      expect(second.couponCount()).assertEqual(0);
      expect(second.coupons.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0650
     * @tc.name      user_accounts_have_independent_levels_065
     * @tc.desc      Verify user accounts have independent levels.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_accounts_have_independent_levels_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_accounts_have_independent_levels_065');
      let first: UserAccount = accountOf('first', 0, 1);
      let second: UserAccount = accountOf('second', 0, 5);
      expect(first.levelName()).assertEqual('bronze');
      expect(second.levelName()).assertEqual('diamond');
      first.level = 3;
      expect(first.levelName()).assertEqual('gold');
      expect(second.levelName()).assertEqual('diamond');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0660
     * @tc.name      user_account_redeem_one_point_from_below_hundred_066
     * @tc.desc      Verify user account redeem one point from below hundred.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_one_point_from_below_hundred_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_one_point_from_below_hundred_066');
      let account: UserAccount = accountOf('shopper', 99, 1);
      expect(account.redeem(1)).assertTrue();
      expect(account.points).assertEqual(98);
      expect(account.pointsValue().cents()).assertEqual(0);
      expect(account.pointsValue().format()).assertEqual('¥0.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0670
     * @tc.name      user_account_redeem_one_less_than_balance_067
     * @tc.desc      Verify user account redeem one less than balance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_one_less_than_balance_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_one_less_than_balance_067');
      let account: UserAccount = accountOf('shopper', 150, 1);
      expect(account.redeem(149)).assertTrue();
      expect(account.points).assertEqual(1);
      expect(account.pointsValue().cents()).assertEqual(0);
      expect(account.level).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0680
     * @tc.name      user_account_add_points_does_not_change_coupon_order_068
     * @tc.desc      Verify user account add points does not change coupon order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_add_points_does_not_change_coupon_order_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_add_points_does_not_change_coupon_order_068');
      let coupons: Coupon[] = [];
      coupons.push(couponOf('C10'));
      coupons.push(couponOf('C20'));
      coupons.push(couponOf('C50'));
      let account: UserAccount = accountWithCoupons('shopper', coupons);
      account.addPoints(700);
      expect(account.couponCount()).assertEqual(3);
      expect(account.coupons[0].id).assertEqual('C10');
      expect(account.coupons[1].id).assertEqual('C20');
      expect(account.coupons[2].id).assertEqual('C50');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0690
     * @tc.name      user_account_redeem_after_add_exact_069
     * @tc.desc      Verify user account redeem after add exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_after_add_exact_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_after_add_exact_069');
      let account: UserAccount = accountOf('shopper', 100, 1);
      expect(account.addPoints(50)).assertEqual(150);
      expect(account.redeem(150)).assertTrue();
      expect(account.points).assertEqual(0);
      expect(account.pointsValue().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0700
     * @tc.name      user_account_redeem_updates_points_and_value_070
     * @tc.desc      Verify user account redeem updates points and value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_updates_points_and_value_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_updates_points_and_value_070');
      // Subtracting 350 and 50 keeps both balances on whole hundreds, so the format stays ¥x.00.
      let starts: number[] = [15350, 150];
      let amounts: number[] = [350, 50];
      let remainders: number[] = [15000, 100];
      let formats: string[] = ['¥150.00', '¥1.00'];
      expect(starts.length).assertEqual(formats.length);
      for (let index: number = 0; index < starts.length; index++) {
        let account: UserAccount = accountOf('shopper', starts[index], 2);
        expect(account.redeem(amounts[index])).assertTrue();
        expect(account.points).assertEqual(remainders[index]);
        expect(account.pointsValue().cents()).assertEqual(remainders[index]);
        expect(account.pointsValue().format()).assertEqual(formats[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0710
     * @tc.name      user_account_multiple_redeems_exhaust_exactly_071
     * @tc.desc      Verify user account multiple redeems exhaust exactly.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_multiple_redeems_exhaust_exactly_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_multiple_redeems_exhaust_exactly_071');
      let account: UserAccount = accountOf('shopper', 100, 1);
      // Three withdrawals 30 + 30 + 40 exhaust the 100 points exactly, so a fourth redeem fails.
      expect(account.redeem(30)).assertTrue();
      expect(account.redeem(30)).assertTrue();
      expect(account.redeem(40)).assertTrue();
      expect(account.points).assertEqual(0);
      expect(account.redeem(1)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0720
     * @tc.name      user_account_redeem_exact_one_hundred_072
     * @tc.desc      Verify user account redeem exact one hundred.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_redeem_exact_one_hundred_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_redeem_exact_one_hundred_072');
      let account: UserAccount = accountOf('shopper', 100, 1);
      expect(account.pointsValue().cents()).assertEqual(100);
      expect(account.redeem(100)).assertTrue();
      expect(account.points).assertEqual(0);
      expect(account.pointsValue().cents()).assertEqual(0);
      expect(account.pointsValue().format()).assertEqual('¥0.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0730
     * @tc.name      user_account_add_negative_after_positive_keeps_balance_073
     * @tc.desc      Verify user account add negative after positive keeps balance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_add_negative_after_positive_keeps_balance_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_add_negative_after_positive_keeps_balance_073');
      let account: UserAccount = accountOf('shopper', 100, 1);
      expect(account.addPoints(30)).assertEqual(130);
      // The -50 delta is discarded, so the balance stays at 130 after the earlier +30.
      expect(account.addPoints(-50)).assertEqual(130);
      expect(account.points).assertEqual(130);
      expect(account.pointsValue().cents()).assertEqual(100);
      expect(account.pointsValue().format()).assertEqual('¥1.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0740
     * @tc.name      user_account_negative_then_positive_add_sequence_074
     * @tc.desc      Verify user account negative then positive add sequence.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_negative_then_positive_add_sequence_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_negative_then_positive_add_sequence_074');
      let account: UserAccount = accountOf('shopper', 0, 1);
      expect(account.addPoints(-50)).assertEqual(0);
      expect(account.addPoints(30)).assertEqual(30);
      expect(account.points).assertEqual(30);
      expect(account.pointsValue().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0750
     * @tc.name      user_account_zero_then_positive_redeem_sequence_075
     * @tc.desc      Verify user account zero then positive redeem sequence.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_zero_then_positive_redeem_sequence_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_zero_then_positive_redeem_sequence_075');
      let account: UserAccount = accountOf('shopper', 50, 1);
      expect(account.redeem(0)).assertFalse();
      expect(account.redeem(20)).assertTrue();
      expect(account.points).assertEqual(30);
      expect(account.pointsValue().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0760
     * @tc.name      user_accounts_points_value_is_independent_076
     * @tc.desc      Verify user accounts points value is independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_accounts_points_value_is_independent_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_accounts_points_value_is_independent_076');
      let first: UserAccount = accountOf('first', 250, 1);
      let second: UserAccount = accountOf('second', 250, 1);
      expect(first.pointsValue().cents()).assertEqual(200);
      expect(second.pointsValue().cents()).assertEqual(200);
      first.addPoints(50);
      expect(first.pointsValue().cents()).assertEqual(300);
      expect(second.pointsValue().cents()).assertEqual(200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0770
     * @tc.name      user_account_failed_redeem_keeps_coupon_wallet_077
     * @tc.desc      Verify user account failed redeem keeps coupon wallet.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_failed_redeem_keeps_coupon_wallet_077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_failed_redeem_keeps_coupon_wallet_077');
      let coupons: Coupon[] = [];
      coupons.push(couponOf('C10'));
      let account: UserAccount = new UserAccount('shopper', 100, 1, coupons);
      expect(account.redeem(999)).assertFalse();
      expect(account.couponCount()).assertEqual(1);
      expect(account.points).assertEqual(100);
      expect(account.coupons[0].id).assertEqual('C10');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0780
     * @tc.name      user_account_empty_balance_rejects_every_redeem_078
     * @tc.desc      Verify user account empty balance rejects every redeem.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_empty_balance_rejects_every_redeem_078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_empty_balance_rejects_every_redeem_078');
      let account: UserAccount = accountOf('empty', 0, 1);
      expect(account.redeem(0)).assertFalse();
      expect(account.redeem(1)).assertFalse();
      expect(account.redeem(-1)).assertFalse();
      expect(account.points).assertEqual(0);
      expect(account.pointsValue().cents()).assertEqual(0);
      expect(account.levelName()).assertEqual('bronze');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_USER_ACCOUNT_0790
     * @tc.name      user_account_level_name_after_multiple_changes_079
     * @tc.desc      Verify user account level name after multiple changes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_account_level_name_after_multiple_changes_079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_account_level_name_after_multiple_changes_079');
      let account: UserAccount = accountOf('level', 0, 1);
      expect(account.levelName()).assertEqual('bronze');
      account.level = 2;
      expect(account.levelName()).assertEqual('silver');
      account.level = 3;
      expect(account.levelName()).assertEqual('gold');
      account.level = 5;
      expect(account.levelName()).assertEqual('diamond');
      expect(account.points).assertEqual(0);
    });
  });
}
