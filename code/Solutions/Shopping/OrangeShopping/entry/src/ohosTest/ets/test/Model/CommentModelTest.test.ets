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
import { Comment } from '../Shared/ShopModel';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Phone 18800001765; masking cases expect '188****1765'. */
function phoneComment(): Comment {
  return new Comment('18800001765', 'works well for daily use', 5);
}

export default function commentModelTest() {
  describe('OrangeShoppingCommentModel', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'comment model suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0010
     * @tc.name      comment_negative_star_values_are_not_positive_001
     * @tc.desc      Verify comment negative star values are not positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_negative_star_values_are_not_positive_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_negative_star_values_are_not_positive_001');
      let stars: number[] = [-1, -100, -4.5];
      expect(stars.length).assertEqual(3);
      for (let index: number = 0; index < stars.length; index++) {
        let comment: Comment = new Comment('user-a', 'negative stars', stars[index]);
        expect(comment.isPositive()).assertFalse();
        expect(comment.stars).assertEqual(stars[index]);
        expect(comment.stars < 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0020
     * @tc.name      comment_default_stars_are_five_002
     * @tc.desc      Verify comment default stars are five.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_default_stars_are_five_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_default_stars_are_five_002');
      let comment: Comment = new Comment('user-a', 'default rating');
      expect(comment.stars).assertEqual(5);
      expect(comment.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0030
     * @tc.name      comment_star_change_flips_low_to_positive_003
     * @tc.desc      Verify comment star change flips low to positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_star_change_flips_low_to_positive_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_star_change_flips_low_to_positive_003');
      let comment: Comment = new Comment('user-a', 'mutable stars', 2);
      let before: boolean = comment.isPositive();
      comment.stars = 4;
      expect(before !== comment.isPositive()).assertTrue();
      expect(comment.isPositive()).assertTrue();
      expect(comment.stars).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0040
     * @tc.name      comment_star_change_flips_positive_to_low_004
     * @tc.desc      Verify comment star change flips positive to low.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_star_change_flips_positive_to_low_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_star_change_flips_positive_to_low_004');
      let comment: Comment = new Comment('user-a', 'mutable stars', 5);
      let before: boolean = comment.isPositive();
      comment.stars = 3;
      expect(before !== comment.isPositive()).assertTrue();
      expect(comment.isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0050
     * @tc.name      comment_star_change_within_positive_band_stays_positive_005
     * @tc.desc      Verify comment star change within positive band stays positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_star_change_within_positive_band_stays_positive_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_star_change_within_positive_band_stays_positive_005');
      let comment: Comment = new Comment('user-a', 'mutable stars', 4);
      let before: boolean = comment.isPositive();
      comment.stars = 5;
      expect(before).assertTrue();
      expect(comment.isPositive()).assertTrue();
      expect(comment.stars).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0060
     * @tc.name      comment_empty_user_is_not_masked_006
     * @tc.desc      Verify comment empty user is not masked.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_empty_user_is_not_masked_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_empty_user_is_not_masked_006');
      let comment: Comment = new Comment('', 'empty user');
      expect(comment.maskedUser().length).assertEqual(0);
      expect(comment.maskedUser().indexOf('*') < 0).assertTrue();
      expect(comment.user.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0070
     * @tc.name      comment_short_users_are_not_masked_007
     * @tc.desc      Verify comment short users are not masked.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_short_users_are_not_masked_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_short_users_are_not_masked_007');
      let users: string[] = ['a', 'abcdefg'];
      // Seven is the longest name that skips masking; maskedUser only rewrites
      // names longer than seven.
      expect(users.length).assertEqual(2);
      for (let index: number = 0; index < users.length; index++) {
        let comment: Comment = new Comment(users[index], 'short user');
        expect(comment.maskedUser()).assertEqual(users[index]);
        expect(comment.maskedUser().length).assertEqual(users[index].length);
        expect(comment.maskedUser().indexOf('*') < 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0080
     * @tc.name      comment_long_user_mask_keeps_the_prefix_008
     * @tc.desc      Verify comment long user mask keeps the prefix.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_long_user_mask_keeps_the_prefix_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_long_user_mask_keeps_the_prefix_008');
      let users: string[] = ['abcdefghi', 'abcdefghijklm', 'abcdefghijklmnop'];
      let masks: string[] = ['abc****fghi', 'abc****jklm', 'abc****mnop'];
      // Nine, thirteen and sixteen characters all collapse to the same
      // 3 prefix + 4 stars + 4 suffix layout, so every mask is eleven long.
      expect(users.length).assertEqual(masks.length);
      for (let index: number = 0; index < users.length; index++) {
        let masked: string = new Comment(users[index], 'mask probe').maskedUser();
        expect(masked).assertEqual(masks[index]);
        expect(masked.length).assertEqual(11);
        expect(masked.startsWith('abc')).assertTrue();
        expect(masked.substring(0, 3)).assertEqual(users[index].substring(0, 3));
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0090
     * @tc.name      comment_long_user_mask_keeps_the_suffix_009
     * @tc.desc      Verify comment long user mask keeps the suffix.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_long_user_mask_keeps_the_suffix_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_long_user_mask_keeps_the_suffix_009');
      let users: string[] = ['abcdefghij', 'abcdefghijklmn', 'abcdefghijk'];
      let masks: string[] = ['abc****ghij', 'abc****klmn', 'abc****hijk'];
      expect(users.length).assertEqual(masks.length);
      for (let index: number = 0; index < users.length; index++) {
        let masked: string = new Comment(users[index], 'mask probe').maskedUser();
        let suffix: string = users[index].substring(users[index].length - 4);
        expect(masked).assertEqual(masks[index]);
        expect(masked.length).assertEqual(11);
        expect(masked.endsWith(suffix)).assertTrue();
        expect(masked.substring(7)).assertEqual(suffix);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0100
     * @tc.name      comment_eleven_digit_phone_is_masked_010
     * @tc.desc      Verify comment eleven digit phone is masked.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_eleven_digit_phone_is_masked_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_eleven_digit_phone_is_masked_010');
      let comment: Comment = phoneComment();
      expect(comment.maskedUser()).assertEqual('188****1765');
      expect(comment.maskedUser().length).assertEqual(11);
      expect(comment.maskedUser().startsWith('188')).assertTrue();
      expect(comment.maskedUser().endsWith('1765')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0110
     * @tc.name      comment_mask_preserves_the_first_three_characters_011
     * @tc.desc      Verify comment mask preserves the first three characters.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_preserves_the_first_three_characters_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_preserves_the_first_three_characters_011');
      let comment: Comment = phoneComment();
      expect(comment.maskedUser().startsWith('188')).assertTrue();
      expect(comment.maskedUser().substring(0, 3)).assertEqual('188');
      expect(comment.user.substring(0, 3)).assertEqual('188');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0120
     * @tc.name      comment_mask_preserves_the_last_four_characters_012
     * @tc.desc      Verify comment mask preserves the last four characters.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_preserves_the_last_four_characters_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_preserves_the_last_four_characters_012');
      let comment: Comment = phoneComment();
      expect(comment.maskedUser().endsWith('1765')).assertTrue();
      expect(comment.maskedUser().substring(7)).assertEqual('1765');
      expect(comment.user.substring(7)).assertEqual('1765');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0130
     * @tc.name      comment_mask_hides_the_middle_digits_013
     * @tc.desc      Verify comment mask hides the middle digits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_hides_the_middle_digits_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_hides_the_middle_digits_013');
      let masked: string = phoneComment().maskedUser();
      expect(masked.indexOf('0000') < 0).assertTrue();
      expect(masked.indexOf('18800001765') < 0).assertTrue();
      expect(masked).assertEqual('188****1765');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0140
     * @tc.name      comment_mask_is_idempotent_for_phone_014
     * @tc.desc      Verify comment mask is idempotent for phone.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_is_idempotent_for_phone_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_is_idempotent_for_phone_014');
      let comment: Comment = phoneComment();
      let once: string = comment.maskedUser();
      let twice: string = comment.maskedUser();
      expect(once).assertEqual(twice);
      expect(twice).assertEqual('188****1765');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0150
     * @tc.name      comment_mask_is_idempotent_for_eight_characters_015
     * @tc.desc      Verify comment mask is idempotent for eight characters.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_is_idempotent_for_eight_characters_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_is_idempotent_for_eight_characters_015');
      let comment: Comment = new Comment('abcdefgh', 'mask eight');
      // Eight characters is the first masked size: prefix 'abc' and suffix
      // 'efgh' consume seven, so the fourth letter 'd' is dropped.
      let once: string = comment.maskedUser();
      let twice: string = comment.maskedUser();
      expect(once).assertEqual(twice);
      expect(twice).assertEqual('abc****efgh');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0160
     * @tc.name      comment_mask_does_not_mutate_the_user_field_016
     * @tc.desc      Verify comment mask does not mutate the user field.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_does_not_mutate_the_user_field_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_does_not_mutate_the_user_field_016');
      let comment: Comment = phoneComment();
      let before: string = comment.user;
      comment.maskedUser();
      expect(comment.user).assertEqual(before);
      expect(comment.user).assertEqual('18800001765');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0170
     * @tc.name      comment_mask_differs_for_different_users_017
     * @tc.desc      Verify comment mask differs for different users.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_differs_for_different_users_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_differs_for_different_users_017');
      let first: Comment = new Comment('abcdefgh', 'first', 5);
      let second: Comment = new Comment('abcdefgi', 'second', 5);
      expect(first.maskedUser() !== second.maskedUser()).assertTrue();
      expect(first.maskedUser()).assertEqual('abc****efgh');
      expect(second.maskedUser()).assertEqual('abc****efgi');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0180
     * @tc.name      comment_mask_changes_with_one_extra_character_018
     * @tc.desc      Verify comment mask changes with one extra character.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_changes_with_one_extra_character_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_changes_with_one_extra_character_018');
      let eight: string = new Comment('abcdefgh', 'eight').maskedUser();
      let nine: string = new Comment('abcdefghi', 'nine').maskedUser();
      expect(eight !== nine).assertTrue();
      expect(eight.length).assertEqual(nine.length);
      expect(nine).assertEqual('abc****fghi');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0190
     * @tc.name      comment_mask_for_long_user_has_one_asterisk_run_019
     * @tc.desc      Verify comment mask for long user has one asterisk run.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_for_long_user_has_one_asterisk_run_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_for_long_user_has_one_asterisk_run_019');
      let masked: string = phoneComment().maskedUser();
      expect(masked.indexOf('****') >= 0).assertTrue();
      expect(masked.indexOf('*****') < 0).assertTrue();
      // The star run begins right after the three kept digits, hence index 3,
      // and it is exactly four stars long.
      expect(masked.indexOf('****')).assertEqual(3);
      expect(masked.indexOf('*')).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0200
     * @tc.name      comment_mask_handles_a_user_with_spaces_020
     * @tc.desc      Verify comment mask handles a user with spaces.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_handles_a_user_with_spaces_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_handles_a_user_with_spaces_020');
      let comment: Comment = new Comment('abc de fghi', 'spaced user');
      expect(comment.maskedUser()).assertEqual('abc****fghi');
      expect(comment.maskedUser().indexOf('****') >= 0).assertTrue();
      expect(comment.user.length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0210
     * @tc.name      comment_mask_keeps_three_and_four_characters_for_any_family_021
     * @tc.desc      Verify comment mask keeps three and four characters for any family.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_keeps_three_and_four_characters_for_any_family_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s',
        'CASE: comment_mask_keeps_three_and_four_characters_for_any_family_021');
      let users: string[] = ['user-1234-5678', '123456789012', 'ABCDEFGH', '@@@@@@@@'];
      let masks: string[] = ['use****5678', '123****9012', 'ABC****EFGH', '@@@****@@@@'];
      expect(users.length).assertEqual(masks.length);
      for (let index: number = 0; index < users.length; index++) {
        let comment: Comment = new Comment(users[index], 'mask probe');
        let masked: string = comment.maskedUser();
        expect(masked).assertEqual(masks[index]);
        expect(masked.startsWith(users[index].substring(0, 3))).assertTrue();
        expect(masked.endsWith(users[index].substring(users[index].length - 4))).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0220
     * @tc.name      comment_mask_on_numeric_eight_character_user_022
     * @tc.desc      Verify comment mask on numeric eight character user.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_on_numeric_eight_character_user_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_on_numeric_eight_character_user_022');
      let comment: Comment = new Comment('12345678', 'numeric eight');
      expect(comment.maskedUser()).assertEqual('123****5678');
      expect(comment.maskedUser().indexOf('12345678') < 0).assertTrue();
      expect(comment.maskedUser().length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0230
     * @tc.name      comment_retains_the_user_field_023
     * @tc.desc      Verify comment retains the user field.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_retains_the_user_field_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_retains_the_user_field_023');
      let comment: Comment = new Comment('alice', 'nice product', 4);
      expect(comment.user).assertEqual('alice');
      expect(comment.user.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0240
     * @tc.name      comment_retains_the_text_field_024
     * @tc.desc      Verify comment retains the text field.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_retains_the_text_field_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_retains_the_text_field_024');
      let comment: Comment = new Comment('alice', 'nice product', 4);
      expect(comment.text).assertEqual('nice product');
      expect(comment.text.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0250
     * @tc.name      comment_retains_the_stars_field_025
     * @tc.desc      Verify comment retains the stars field.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_retains_the_stars_field_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_retains_the_stars_field_025');
      let comment: Comment = new Comment('alice', 'nice product', 4);
      expect(comment.stars).assertEqual(4);
      expect(comment.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0260
     * @tc.name      comment_accepts_empty_text_026
     * @tc.desc      Verify comment accepts empty text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_accepts_empty_text_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_accepts_empty_text_026');
      let comment: Comment = new Comment('alice', '', 5);
      expect(comment.text.length).assertEqual(0);
      expect(comment.text.length).assertEqual(0);
      expect(comment.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0270
     * @tc.name      comment_retains_whitespace_text_027
     * @tc.desc      Verify comment retains whitespace text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_retains_whitespace_text_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_retains_whitespace_text_027');
      let comment: Comment = new Comment('alice', '   ', 3);
      expect(comment.text).assertEqual('   ');
      expect(comment.text.length).assertEqual(3);
      expect(comment.isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0280
     * @tc.name      comment_accepts_empty_user_028
     * @tc.desc      Verify comment accepts empty user.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_accepts_empty_user_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_accepts_empty_user_028');
      let comment: Comment = new Comment('', 'anonymous review', 5);
      expect(comment.user.length).assertEqual(0);
      expect(comment.maskedUser().length).assertEqual(0);
      expect(comment.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0290
     * @tc.name      comment_default_constructor_uses_five_stars_029
     * @tc.desc      Verify comment default constructor uses five stars.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_default_constructor_uses_five_stars_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_default_constructor_uses_five_stars_029');
      let comment: Comment = new Comment('alice', 'default rated');
      expect(comment.stars).assertEqual(5);
      expect(comment.isPositive()).assertTrue();
      expect(comment.user).assertEqual('alice');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0300
     * @tc.name      comment_default_constructor_accepts_empty_text_030
     * @tc.desc      Verify comment default constructor accepts empty text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_default_constructor_accepts_empty_text_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_default_constructor_accepts_empty_text_030');
      let comment: Comment = new Comment('alice', '');
      expect(comment.text.length).assertEqual(0);
      expect(comment.stars).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0310
     * @tc.name      comment_two_instances_do_not_share_user_or_text_031
     * @tc.desc      Verify comment two instances do not share user or text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_two_instances_do_not_share_user_or_text_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_two_instances_do_not_share_user_or_text_031');
      let first: Comment = new Comment('alice', 'first review', 4);
      let second: Comment = new Comment('bob', 'second review', 4);
      // Each Comment owns its own strings, so rewriting the first leaves the
      // second's text and user untouched.
      first.text = 'rewritten review';
      first.user = 'carol';
      expect(second.text).assertEqual('second review');
      expect(second.user).assertEqual('bob');
      expect(first.text).assertEqual('rewritten review');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0320
     * @tc.name      comment_two_instances_with_same_fields_keep_independent_state_032
     * @tc.desc      Verify comment two instances with same fields keep independent state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_two_instances_with_same_fields_keep_independent_state_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_two_instances_with_same_fields_keep_independent_state_032');
      let first: Comment = new Comment('alice', 'same review', 5);
      let second: Comment = new Comment('alice', 'same review', 5);
      first.stars = 1;
      expect(first.isPositive()).assertFalse();
      expect(second.isPositive()).assertTrue();
      expect(first.text).assertEqual(second.text);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0330
     * @tc.name      comment_same_user_keeps_the_same_mask_033
     * @tc.desc      Verify comment same user keeps the same mask.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_same_user_keeps_the_same_mask_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_same_user_keeps_the_same_mask_033');
      let first: Comment = new Comment('18800001765', 'first review', 5);
      let second: Comment = new Comment('18800001765', 'second review', 1);
      expect(first.maskedUser()).assertEqual(second.maskedUser());
      expect(first.maskedUser()).assertEqual('188****1765');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0340
     * @tc.name      comment_stars_do_not_change_the_mask_034
     * @tc.desc      Verify comment stars do not change the mask.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_stars_do_not_change_the_mask_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_stars_do_not_change_the_mask_034');
      let comment: Comment = new Comment('18800001765', 'review', 5);
      let before: string = comment.maskedUser();
      comment.stars = 1;
      expect(comment.maskedUser()).assertEqual(before);
      expect(comment.isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0350
     * @tc.name      comment_masking_does_not_change_text_or_stars_035
     * @tc.desc      Verify comment masking does not change text or stars.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_masking_does_not_change_text_or_stars_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_masking_does_not_change_text_or_stars_035');
      let comment: Comment = new Comment('18800001765', 'unchanged text', 3);
      comment.maskedUser();
      expect(comment.text).assertEqual('unchanged text');
      expect(comment.stars).assertEqual(3);
      expect(comment.isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0360
     * @tc.name      comment_retains_a_long_text_verbatim_036
     * @tc.desc      Verify comment retains a long text verbatim.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_retains_a_long_text_verbatim_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_retains_a_long_text_verbatim_036');
      let text: string = 'the battery lasts two full days with heavy use and the screen is bright';
      let comment: Comment = new Comment('alice', text, 5);
      expect(comment.text).assertEqual(text);
      // Nothing truncates the body, so all 71 typed characters are stored.
      expect(comment.text.length).assertEqual(71);
      expect(comment.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0370
     * @tc.name      comment_retains_a_line_break_in_text_037
     * @tc.desc      Verify comment retains a line break in text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_retains_a_line_break_in_text_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_retains_a_line_break_in_text_037');
      let comment: Comment = new Comment('alice', 'first line\nsecond line', 4);
      expect(comment.text.indexOf('\n') >= 0).assertTrue();
      // 'first line' fills indices 0..9, so the retained newline sits at 10.
      expect(comment.text.indexOf('\n')).assertEqual(10);
      expect(comment.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0380
     * @tc.name      comment_retains_numeric_text_038
     * @tc.desc      Verify comment retains numeric text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_retains_numeric_text_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_retains_numeric_text_038');
      let comment: Comment = new Comment('alice', '12345', 4);
      expect(comment.text).assertEqual('12345');
      expect(comment.text.length).assertEqual(5);
      expect(comment.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0390
     * @tc.name      comment_mask_does_not_leak_a_short_user_into_asterisks_039
     * @tc.desc      Verify comment mask does not leak a short user into asterisks.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_does_not_leak_a_short_user_into_asterisks_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_does_not_leak_a_short_user_into_asterisks_039');
      let users: string[] = ['a', 'ab', 'abc'];
      for (let index: number = 0; index < users.length; index++) {
        let comment: Comment = new Comment(users[index], 'short');
        expect(comment.maskedUser()).assertEqual(users[index]);
        expect(comment.maskedUser().indexOf('*') < 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0400
     * @tc.name      comment_mask_handles_a_user_with_leading_space_040
     * @tc.desc      Verify comment mask handles a user with leading space.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_handles_a_user_with_leading_space_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_handles_a_user_with_leading_space_040');
      let comment: Comment = new Comment(' abcdefg', 'leading space');
      // The prefix is the first three raw characters, so the leading space is
      // kept inside it rather than trimmed away.
      expect(comment.maskedUser()).assertEqual(' ab****defg');
      expect(comment.maskedUser().startsWith(' ab')).assertTrue();
      expect(comment.user.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0410
     * @tc.name      comment_mask_handles_a_user_with_trailing_space_041
     * @tc.desc      Verify comment mask handles a user with trailing space.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_handles_a_user_with_trailing_space_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_handles_a_user_with_trailing_space_041');
      let comment: Comment = new Comment('abcdefg ', 'trailing space');
      expect(comment.maskedUser()).assertEqual('abc****efg ');
      expect(comment.maskedUser().endsWith('fg ')).assertTrue();
      expect(comment.user.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0420
     * @tc.name      comment_mask_handles_mixed_case_characters_042
     * @tc.desc      Verify comment mask handles mixed case characters.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_handles_mixed_case_characters_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_handles_mixed_case_characters_042');
      let comment: Comment = new Comment('AbCdEfGh', 'mixed case user');
      expect(comment.maskedUser()).assertEqual('AbC****EfGh');
      expect(comment.maskedUser().length).assertEqual(11);
      expect(comment.maskedUser().indexOf('****') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0430
     * @tc.name      comment_ten_numeric_user_masks_the_middle_043
     * @tc.desc      Verify comment ten numeric user masks the middle.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_ten_numeric_user_masks_the_middle_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_ten_numeric_user_masks_the_middle_043');
      let comment: Comment = new Comment('1234567890', 'numeric ten');
      let masked: string = comment.maskedUser();
      expect(masked.length).assertEqual(11);
      expect(masked.substring(0, 3)).assertEqual('123');
      expect(masked.substring(7)).assertEqual('7890');
      expect(masked.indexOf('****') >= 0).assertTrue();
      // Digits 4 through 7 of '1234567890' fall inside the star run, so the
      // fragment '4567' must not be findable.
      expect(masked.indexOf('4567') < 0).assertTrue();
      expect(comment.user.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0440
     * @tc.name      comment_mask_handles_eleven_numeric_characters_044
     * @tc.desc      Verify comment mask handles eleven numeric characters.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_handles_eleven_numeric_characters_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_handles_eleven_numeric_characters_044');
      let comment: Comment = new Comment('12345678901', 'numeric eleven');
      expect(comment.maskedUser()).assertEqual('123****8901');
      expect(comment.user.length).assertEqual(11);
      expect(comment.maskedUser().endsWith('8901')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0450
     * @tc.name      comment_text_change_does_not_change_user_or_stars_045
     * @tc.desc      Verify comment text change does not change user or stars.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_text_change_does_not_change_user_or_stars_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_text_change_does_not_change_user_or_stars_045');
      let comment: Comment = new Comment('alice', 'original text', 4);
      comment.text = 'replacement text';
      expect(comment.text).assertEqual('replacement text');
      expect(comment.user).assertEqual('alice');
      expect(comment.stars).assertEqual(4);
      expect(comment.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0460
     * @tc.name      comment_user_change_updates_the_mask_046
     * @tc.desc      Verify comment user change updates the mask.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_user_change_updates_the_mask_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_user_change_updates_the_mask_046');
      let comment: Comment = new Comment('abcdefgh', 'user change', 5);
      let before: string = comment.maskedUser();
      comment.user = '18800001765';
      let after: string = comment.maskedUser();
      expect(before !== after).assertTrue();
      expect(before).assertEqual('abc****efgh');
      expect(after).assertEqual('188****1765');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0470
     * @tc.name      comment_stars_change_does_not_change_user_or_text_047
     * @tc.desc      Verify comment stars change does not change user or text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_stars_change_does_not_change_user_or_text_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_stars_change_does_not_change_user_or_text_047');
      let comment: Comment = new Comment('alice', 'stable text', 5);
      comment.stars = 2;
      expect(comment.user).assertEqual('alice');
      expect(comment.text).assertEqual('stable text');
      expect(comment.isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0480
     * @tc.name      comment_stars_four_and_above_are_positive_048
     * @tc.desc      Verify comment stars four and above are positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_stars_four_and_above_are_positive_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_stars_four_and_above_are_positive_048');
      let stars: number[] = [4, 4.5, 5, 100];
      for (let index: number = 0; index < stars.length; index++) {
        let comment: Comment = new Comment('threshold-user', 'star probe', stars[index]);
        expect(comment.isPositive()).assertTrue();
        expect(comment.stars).assertEqual(stars[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0490
     * @tc.name      comment_stars_below_four_are_not_positive_049
     * @tc.desc      Verify comment stars below four are not positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_stars_below_four_are_not_positive_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_stars_below_four_are_not_positive_049');
      let stars: number[] = [0, 3, 3.9];
      // 3.9 sits just under the 4-star cut-off, so isPositive compares the raw
      // number instead of rounding it up.
      for (let index: number = 0; index < stars.length; index++) {
        let comment: Comment = new Comment('threshold-user', 'star probe', stars[index]);
        expect(comment.isPositive()).assertFalse();
        expect(comment.stars).assertEqual(stars[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0500
     * @tc.name      comment_shortening_the_user_removes_the_mask_050
     * @tc.desc      Verify comment shortening the user removes the mask.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_shortening_the_user_removes_the_mask_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_shortening_the_user_removes_the_mask_050');
      let comment: Comment = phoneComment();
      expect(comment.maskedUser()).assertEqual('188****1765');
      comment.user = 'abcdefg';
      // Seven characters is back under the masking threshold, so the plain name
      // is returned instead of a star pattern.
      expect(comment.maskedUser()).assertEqual('abcdefg');
      expect(comment.maskedUser().length).assertEqual(7);
      expect(comment.maskedUser().indexOf('*') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0510
     * @tc.name      comment_clearing_the_user_clears_the_mask_051
     * @tc.desc      Verify comment clearing the user clears the mask.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_clearing_the_user_clears_the_mask_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_clearing_the_user_clears_the_mask_051');
      let comment: Comment = phoneComment();
      comment.user = '';
      expect(comment.user.length).assertEqual(0);
      expect(comment.maskedUser().length).assertEqual(0);
      expect(comment.maskedUser().indexOf('*') < 0).assertTrue();
      expect(comment.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0520
     * @tc.name      comment_user_change_does_not_affect_another_instance_052
     * @tc.desc      Verify comment user change does not affect another instance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_user_change_does_not_affect_another_instance_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_user_change_does_not_affect_another_instance_052');
      let first: Comment = phoneComment();
      let second: Comment = phoneComment();
      first.user = 'abcdefgh';
      expect(first.maskedUser()).assertEqual('abc****efgh');
      expect(second.maskedUser()).assertEqual('188****1765');
      expect(second.user).assertEqual('18800001765');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0530
     * @tc.name      comment_mask_follows_successive_user_changes_053
     * @tc.desc      Verify comment mask follows successive user changes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_follows_successive_user_changes_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_follows_successive_user_changes_053');
      let comment: Comment = new Comment('abcdefgh', 'mask trail', 5);
      expect(comment.maskedUser()).assertEqual('abc****efgh');
      comment.user = '18800001765';
      expect(comment.maskedUser()).assertEqual('188****1765');
      comment.user = 'abcdefghi';
      expect(comment.maskedUser()).assertEqual('abc****fghi');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0540
     * @tc.name      comment_mask_is_stable_when_text_changes_054
     * @tc.desc      Verify comment mask is stable when text changes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_is_stable_when_text_changes_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_is_stable_when_text_changes_054');
      let comment: Comment = phoneComment();
      let before: string = comment.maskedUser();
      comment.text = 'a completely different review body';
      expect(comment.maskedUser()).assertEqual(before);
      expect(comment.maskedUser()).assertEqual('188****1765');
      expect(comment.user).assertEqual('18800001765');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0550
     * @tc.name      comment_text_can_be_cleared_after_construction_055
     * @tc.desc      Verify comment text can be cleared after construction.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_text_can_be_cleared_after_construction_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_text_can_be_cleared_after_construction_055');
      let comment: Comment = new Comment('alice', 'original text', 4);
      comment.text = '';
      expect(comment.text.length).assertEqual(0);
      expect(comment.user).assertEqual('alice');
      expect(comment.stars).assertEqual(4);
      expect(comment.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0560
     * @tc.name      comment_stars_can_be_cleared_to_zero_056
     * @tc.desc      Verify comment stars can be cleared to zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_stars_can_be_cleared_to_zero_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_stars_can_be_cleared_to_zero_056');
      let comment: Comment = new Comment('alice', 'star reset', 5);
      let before: boolean = comment.isPositive();
      comment.stars = 0;
      expect(before !== comment.isPositive()).assertTrue();
      expect(comment.isPositive()).assertFalse();
      expect(comment.stars).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0570
     * @tc.name      comment_is_positive_after_repeated_mutations_057
     * @tc.desc      Verify comment is positive after repeated mutations.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_is_positive_after_repeated_mutations_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_is_positive_after_repeated_mutations_057');
      let comment: Comment = new Comment('alice', 'star trail', 2);
      expect(comment.isPositive()).assertFalse();
      comment.stars = 4;
      expect(comment.isPositive()).assertTrue();
      comment.stars = 3;
      expect(comment.isPositive()).assertFalse();
      comment.stars = 5;
      expect(comment.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0580
     * @tc.name      comment_text_with_braces_and_quotes_is_retained_058
     * @tc.desc      Verify comment text with braces and quotes is retained.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_text_with_braces_and_quotes_is_retained_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_text_with_braces_and_quotes_is_retained_058');
      let text: string = '{"rating":5} and a "quote"';
      let comment: Comment = new Comment('alice', text, 5);
      expect(comment.text).assertEqual(text);
      expect(comment.text.indexOf('{"rating":5}') >= 0).assertTrue();
      expect(comment.text.indexOf('"quote"') >= 0).assertTrue();
      expect(comment.isPositive()).assertTrue();
    });
    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0590
     * @tc.name      comment_mask_prefix_and_suffix_come_from_the_user_059
     * @tc.desc      Verify comment mask prefix and suffix come from the user.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_prefix_and_suffix_come_from_the_user_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_prefix_and_suffix_come_from_the_user_059');
      let users: string[] = ['abcdefgh', 'abcdefghi', 'abcdefghij', '18800001765', 'abcdefghijkl'];
      for (let index: number = 0; index < users.length; index++) {
        let comment: Comment = new Comment(users[index], 'mask probe', 5);
        let masked: string = comment.maskedUser();
        expect(masked.startsWith(users[index].substring(0, 3))).assertTrue();
        expect(masked.endsWith(users[index].substring(users[index].length - 4))).assertTrue();
        // Every mask is eleven characters, so even the twelve-character source
        // name cannot appear inside it verbatim.
        expect(masked.indexOf(users[index]) < 0).assertTrue();
        expect(masked.length).assertEqual(11);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0600
     * @tc.name      comment_masks_of_three_users_are_distinct_060
     * @tc.desc      Verify comment masks of three users are distinct.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_masks_of_three_users_are_distinct_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_masks_of_three_users_are_distinct_060');
      let first: Comment = new Comment('abcdefgh', 'first review', 5);
      let second: Comment = new Comment('abcdefgi', 'second review', 4);
      let third: Comment = new Comment('12345678', 'third review', 3);
      expect(first.maskedUser() !== second.maskedUser()).assertTrue();
      expect(second.maskedUser() !== third.maskedUser()).assertTrue();
      expect(first.maskedUser() !== third.maskedUser()).assertTrue();
      expect(first.maskedUser().length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0610
     * @tc.name      comment_user_and_text_can_be_reassigned_together_061
     * @tc.desc      Verify comment user and text can be reassigned together.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_user_and_text_can_be_reassigned_together_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_user_and_text_can_be_reassigned_together_061');
      let comment: Comment = new Comment('alice', 'old text', 4);
      comment.user = 'bob';
      comment.text = 'new text';
      expect(comment.user).assertEqual('bob');
      expect(comment.text).assertEqual('new text');
      expect(comment.maskedUser()).assertEqual('bob');
      expect(comment.stars).assertEqual(4);
      expect(comment.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0620
     * @tc.name      comment_text_growth_keeps_user_stars_and_mask_062
     * @tc.desc      Verify comment text growth keeps user stars and mask.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_text_growth_keeps_user_stars_and_mask_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_text_growth_keeps_user_stars_and_mask_062');
      let comment: Comment = phoneComment();
      let before: string = comment.maskedUser();
      let oldLength: number = comment.text.length;
      comment.text = comment.text + ' and more details';
      expect(comment.text.length > oldLength).assertTrue();
      expect(comment.user).assertEqual('18800001765');
      expect(comment.stars).assertEqual(5);
      expect(comment.maskedUser()).assertEqual(before);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0630
     * @tc.name      comment_stars_can_become_negative_after_construction_063
     * @tc.desc      Verify comment stars can become negative after construction.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_stars_can_become_negative_after_construction_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_stars_can_become_negative_after_construction_063');
      let comment: Comment = new Comment('alice', 'mutation', 5);
      let before: boolean = comment.isPositive();
      // The stars field has no setter guard, so a 5-star comment can be pushed
      // below the threshold after construction.
      comment.stars = -1;
      expect(before !== comment.isPositive()).assertTrue();
      expect(comment.isPositive()).assertFalse();
      expect(comment.stars < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0640
     * @tc.name      comment_mask_is_idempotent_for_twelve_characters_064
     * @tc.desc      Verify comment mask is idempotent for twelve characters.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_mask_is_idempotent_for_twelve_characters_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_mask_is_idempotent_for_twelve_characters_064');
      let comment: Comment = new Comment('abcdefghijkl', 'twelve probe', 5);
      let once: string = comment.maskedUser();
      let twice: string = comment.maskedUser();
      expect(once).assertEqual(twice);
      expect(once).assertEqual('abc****ijkl');
      expect(once.length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0650
     * @tc.name      comment_short_users_are_returned_unchanged_065
     * @tc.desc      Verify comment short users are returned unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_short_users_are_returned_unchanged_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_short_users_are_returned_unchanged_065');
      let users: string[] = ['ab', 'abc', 'abcd', 'abcde', 'abcdef'];
      expect(users.length).assertEqual(5);
      for (let index: number = 0; index < users.length; index++) {
        let comment: Comment = new Comment(users[index], 'short user');
        expect(comment.maskedUser()).assertEqual(users[index]);
        expect(comment.maskedUser().length).assertEqual(users[index].length);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_COMMENT_MODEL_0660
     * @tc.name      comment_long_users_keep_three_and_four_characters_066
     * @tc.desc      Verify comment long users keep three and four characters.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_long_users_keep_three_and_four_characters_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_long_users_keep_three_and_four_characters_066');
      let users: string[] = ['abcdefgh', 'abcdefghijkl', 'abcdefghijklmno', 'abcdefghijklmnopqrst'];
      let masked: string[] = ['abc****efgh', 'abc****ijkl', 'abc****lmno', 'abc****qrst'];
      expect(users.length).assertEqual(masked.length);
      for (let index: number = 0; index < users.length; index++) {
        let comment: Comment = new Comment(users[index], 'mask probe');
        expect(comment.maskedUser()).assertEqual(masked[index]);
        expect(comment.maskedUser().length).assertEqual(11);
        expect(comment.maskedUser().indexOf('****') >= 0).assertTrue();
      }
    });

  });
}
