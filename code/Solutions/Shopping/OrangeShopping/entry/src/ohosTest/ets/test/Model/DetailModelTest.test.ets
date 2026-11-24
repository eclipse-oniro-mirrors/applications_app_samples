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
import { Comment, DetailModel, Goods } from '../Shared/ShopModel';
import { CATEGORY_PHONE, LABEL_NEW, createGoods } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Id 21, 259900 cents, 12 in stock, 34 sold, live room 2. */
function detailGoods(): Goods {
  return createGoods(21, 'Detail Fixture Phone', 259900, CATEGORY_PHONE,
    'detail fixture', LABEL_NEW, 12, 34, 5, 2);
}

/** Names run swiper0 through swiper(size - 1). */
function galleryOf(size: number): string[] {
  let images: string[] = [];
  for (let index: number = 0; index < size; index++) {
    images.push('swiper' + index.toString());
  }
  return images;
}

/** Users 1880000000 + index, texts 'review N'; only stars matter. */
function reviewStars(stars: number[]): Comment[] {
  let reviews: Comment[] = [];
  for (let index: number = 0; index < stars.length; index++) {
    reviews.push(new Comment('188000000' + index.toString(), 'review ' + index.toString(), stars[index]));
  }
  return reviews;
}

function reviewOf(user: string, text: string, stars: number): Comment {
  return new Comment(user, text, stars);
}

/** Gallery, reviews and choices are stored by reference, not copied. */
function detailWith(images: string[], reviews: Comment[], choices: string[]): DetailModel {
  return new DetailModel(detailGoods(), images, reviews, choices);
}

export default function detailModelTest() {
  describe('OrangeShoppingDetailModel', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'detail model suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0010
     * @tc.name      detail_selects_the_first_choice_by_default_001
     * @tc.desc      Verify detail selects the first choice by default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_selects_the_first_choice_by_default_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_selects_the_first_choice_by_default_001');
      let choices: string[] = ['black', 'silver', 'blue'];
      let model: DetailModel = detailWith(galleryOf(4), reviewStars([5, 4]), choices);
      expect(model.selectedChoice).assertEqual(0);
      expect(model.choiceName()).assertEqual('black');
      expect(model.choices.length).assertEqual(3);
      expect(model.choices[0]).assertEqual('black');
      expect(model.imageCount()).assertEqual(4);
      expect(model.commentCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0020
     * @tc.name      detail_without_choices_starts_with_no_selection_002
     * @tc.desc      Verify detail without choices starts with no selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_without_choices_starts_with_no_selection_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_without_choices_starts_with_no_selection_002');
      let model: DetailModel = detailWith(galleryOf(2), reviewStars([5]), []);
      expect(model.selectedChoice).assertEqual(-1);
      expect(model.choiceName().length).assertEqual(0);
      expect(model.selectChoice(0)).assertFalse();
      expect(model.selectedChoice).assertEqual(-1);
      expect(model.imageCount()).assertEqual(2);
      expect(model.commentCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0030
     * @tc.name      detail_with_all_empty_input_reports_empty_statistics_003
     * @tc.desc      Verify detail with all empty input reports empty statistics.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_with_all_empty_input_reports_empty_statistics_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_with_all_empty_input_reports_empty_statistics_003');
      let model: DetailModel = detailWith([], [], []);
      expect(model.imageCount()).assertEqual(0);
      expect(model.commentCount()).assertEqual(0);
      expect(model.positiveCount()).assertEqual(0);
      expect(model.positiveRate()).assertEqual(0);
      expect(model.averageStars()).assertEqual(0);
      expect(model.selectedChoice).assertEqual(-1);
      expect(model.choiceName().length).assertEqual(0);
      expect(model.images.length).assertEqual(0);
      expect(model.comments.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0040
     * @tc.name      detail_construction_keeps_the_supplied_choice_list_004
     * @tc.desc      Verify detail construction keeps the supplied choice list.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_construction_keeps_the_supplied_choice_list_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_construction_keeps_the_supplied_choice_list_004');
      let choices: string[] = ['black', 'silver'];
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), choices);
      expect(model.choices.length).assertEqual(2);
      expect(model.choices[0]).assertEqual('black');
      expect(model.choices[1]).assertEqual('silver');
      expect(model.choices.length).assertEqual(2);
      expect(model.choiceName()).assertEqual('black');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0050
     * @tc.name      detail_constructed_with_one_choice_starts_on_it_005
     * @tc.desc      Verify detail constructed with one choice starts on it.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_constructed_with_one_choice_starts_on_it_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_constructed_with_one_choice_starts_on_it_005');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), ['only']);
      expect(model.selectedChoice).assertEqual(0);
      expect(model.choiceName()).assertEqual('only');
      expect(model.choices.length).assertEqual(1);
      expect(model.commentCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0060
     * @tc.name      detail_image_count_matches_the_supplied_gallery_006
     * @tc.desc      Verify detail image count matches the supplied gallery.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_image_count_matches_the_supplied_gallery_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_image_count_matches_the_supplied_gallery_006');
      let images: string[] = galleryOf(4);
      let model: DetailModel = detailWith(images, reviewStars([5]), ['black']);
      expect(model.imageCount()).assertEqual(4);
      expect(model.images.length).assertEqual(4);
      expect(model.images[0]).assertEqual('swiper0');
      expect(model.images[3]).assertEqual('swiper3');
      expect(model.commentCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0070
     * @tc.name      detail_empty_gallery_reports_zero_images_007
     * @tc.desc      Verify detail empty gallery reports zero images.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_empty_gallery_reports_zero_images_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_empty_gallery_reports_zero_images_007');
      let model: DetailModel = detailWith([], reviewStars([4]), ['black']);
      expect(model.imageCount()).assertEqual(0);
      expect(model.images.length).assertEqual(0);
      expect(model.commentCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(100);
      expect(model.positiveCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0080
     * @tc.name      detail_preserves_the_gallery_order_008
     * @tc.desc      Verify detail preserves the gallery order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_preserves_the_gallery_order_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_preserves_the_gallery_order_008');
      let images: string[] = ['first', 'second', 'third'];
      let model: DetailModel = detailWith(images, reviewStars([5]), ['black']);
      expect(model.images[0]).assertEqual('first');
      expect(model.images[1]).assertEqual('second');
      expect(model.images[2]).assertEqual('third');
      expect(model.imageCount()).assertEqual(3);
      expect(model.images.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0090
     * @tc.name      detail_counts_duplicate_gallery_entries_009
     * @tc.desc      Verify detail counts duplicate gallery entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_counts_duplicate_gallery_entries_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_counts_duplicate_gallery_entries_009');
      let images: string[] = ['same', 'same', 'same'];
      let model: DetailModel = detailWith(images, reviewStars([5]), ['black']);
      expect(model.imageCount()).assertEqual(3);
      expect(model.images[1]).assertEqual('same');
      expect(model.images[2]).assertEqual('same');
      expect(model.comments.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0100
     * @tc.name      detail_tracks_gallery_growth_through_the_supplied_array_010
     * @tc.desc      Verify detail tracks gallery growth through the supplied array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_tracks_gallery_growth_through_the_supplied_array_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_tracks_gallery_growth_through_the_supplied_array_010');
      let images: string[] = ['first'];
      let model: DetailModel = detailWith(images, reviewStars([5]), ['black']);
      expect(model.imageCount()).assertEqual(1);
      images.push('second');
      expect(model.imageCount()).assertEqual(2);
      expect(model.images[1]).assertEqual('second');
      expect(model.images.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0110
     * @tc.name      detail_single_image_gallery_still_reports_one_011
     * @tc.desc      Verify detail single image gallery still reports one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_single_image_gallery_still_reports_one_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_single_image_gallery_still_reports_one_011');
      let images: string[] = ['only-image'];
      let model: DetailModel = detailWith(images, reviewStars([5]), ['black']);
      expect(model.imageCount()).assertEqual(1);
      expect(model.images[0]).assertEqual('only-image');
      expect(model.images.length).assertEqual(1);
      expect(model.commentCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0120
     * @tc.name      detail_large_gallery_reports_every_entry_012
     * @tc.desc      Verify detail large gallery reports every entry.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_large_gallery_reports_every_entry_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_large_gallery_reports_every_entry_012');
      let images: string[] = galleryOf(16);
      let model: DetailModel = detailWith(images, reviewStars([5]), ['black']);
      expect(model.imageCount()).assertEqual(16);
      expect(model.images[0]).assertEqual('swiper0');
      expect(model.images[15]).assertEqual('swiper15');
      expect(model.images.length).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0130
     * @tc.name      detail_comment_count_matches_the_supplied_reviews_013
     * @tc.desc      Verify detail comment count matches the supplied reviews.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_comment_count_matches_the_supplied_reviews_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_comment_count_matches_the_supplied_reviews_013');
      let model: DetailModel = detailWith(galleryOf(3), reviewStars([5, 4, 3]), ['black']);
      expect(model.commentCount()).assertEqual(3);
      expect(model.comments.length).assertEqual(3);
      expect(model.comments[0].text).assertEqual('review 0');
      expect(model.comments[2].text).assertEqual('review 2');
      expect(model.comments[1].stars).assertEqual(4);
      // Stars 5 and 4 clear the >= 4 cutoff; the trailing 3 does not.
      expect(model.positiveCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0140
     * @tc.name      detail_empty_review_list_reports_zero_comments_014
     * @tc.desc      Verify detail empty review list reports zero comments.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_empty_review_list_reports_zero_comments_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_empty_review_list_reports_zero_comments_014');
      let model: DetailModel = detailWith(galleryOf(5), [], ['black', 'silver']);
      expect(model.commentCount()).assertEqual(0);
      expect(model.positiveCount()).assertEqual(0);
      expect(model.positiveRate()).assertEqual(0);
      expect(model.averageStars()).assertEqual(0);
      expect(model.imageCount()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0150
     * @tc.name      detail_preserves_the_review_order_015
     * @tc.desc      Verify detail preserves the review order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_preserves_the_review_order_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_preserves_the_review_order_015');
      let reviews: Comment[] = [
        reviewOf('first-user', 'first review', 5),
        reviewOf('middle-user', 'middle review', 3),
        reviewOf('last-user', 'last review', 4)
      ];
      let model: DetailModel = detailWith(galleryOf(1), reviews, ['black']);
      expect(model.comments[0].user).assertEqual('first-user');
      expect(model.comments[1].user).assertEqual('middle-user');
      expect(model.comments[2].user).assertEqual('last-user');
      expect(model.comments[1].stars).assertEqual(3);
      expect(model.comments.length).assertEqual(3);
      expect(model.positiveCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0160
     * @tc.name      detail_counts_a_repeated_review_instance_twice_016
     * @tc.desc      Verify detail counts a repeated review instance twice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_counts_a_repeated_review_instance_twice_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_counts_a_repeated_review_instance_twice_016');
      let shared: Comment = reviewOf('18800001765', 'repeated review', 5);
      let reviews: Comment[] = [shared, shared];
      let model: DetailModel = detailWith(galleryOf(1), reviews, ['black']);
      expect(model.commentCount()).assertEqual(2);
      expect(model.positiveCount()).assertEqual(2);
      expect(model.positiveRate()).assertEqual(100);
      expect(model.averageStars()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0170
     * @tc.name      detail_counts_reviews_from_the_same_user_separately_017
     * @tc.desc      Verify detail counts reviews from the same user separately.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_counts_reviews_from_the_same_user_separately_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_counts_reviews_from_the_same_user_separately_017');
      let reviews: Comment[] = [
        reviewOf('18800001765', 'first order review', 5),
        reviewOf('18800001765', 'second order review', 2)
      ];
      let model: DetailModel = detailWith(galleryOf(1), reviews, ['black']);
      expect(model.commentCount()).assertEqual(2);
      expect(model.positiveCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(50);
      expect(model.comments[0].user).assertEqual(model.comments[1].user);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0180
     * @tc.name      detail_tracks_review_growth_through_the_supplied_array_018
     * @tc.desc      Verify detail tracks review growth through the supplied array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_tracks_review_growth_through_the_supplied_array_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_tracks_review_growth_through_the_supplied_array_018');
      let reviews: Comment[] = [reviewOf('18800001765', 'first review', 5)];
      let model: DetailModel = detailWith(galleryOf(1), reviews, ['black']);
      expect(model.commentCount()).assertEqual(1);
      reviews.push(reviewOf('13900001234', 'second review', 2));
      expect(model.commentCount()).assertEqual(2);
      expect(model.positiveCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(50);
      expect(model.averageStars()).assertEqual(3.5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0190
     * @tc.name      detail_counts_reviews_with_empty_text_019
     * @tc.desc      Verify detail counts reviews with empty text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_counts_reviews_with_empty_text_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_counts_reviews_with_empty_text_019');
      let reviews: Comment[] = [
        reviewOf('18800001765', '', 5),
        reviewOf('13900001234', '   ', 2)
      ];
      let model: DetailModel = detailWith(galleryOf(1), reviews, ['black']);
      expect(model.commentCount()).assertEqual(2);
      expect(model.positiveCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(50);
      expect(model.comments[0].text.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0200
     * @tc.name      detail_large_review_list_is_counted_completely_020
     * @tc.desc      Verify detail large review list is counted completely.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_large_review_list_is_counted_completely_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_large_review_list_is_counted_completely_020');
      let reviews: Comment[] = reviewStars([5, 4, 3, 2, 1]);
      let model: DetailModel = detailWith(galleryOf(1), reviews, ['black']);
      expect(model.commentCount()).assertEqual(5);
      // Two of the five reviews reach four stars, so the rate is 200 / 5 = 40 percent.
      expect(model.positiveCount()).assertEqual(2);
      expect(model.positiveRate()).assertEqual(40);
      expect(model.averageStars()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0210
     * @tc.name      detail_positive_count_includes_four_and_five_stars_021
     * @tc.desc      Verify detail positive count includes four and five stars.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_positive_count_includes_four_and_five_stars_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_positive_count_includes_four_and_five_stars_021');
      let model: DetailModel = detailWith(galleryOf(2), reviewStars([5, 4, 3, 2, 1]), ['black']);
      expect(model.positiveCount()).assertEqual(2);
      expect(model.commentCount()).assertEqual(5);
      expect(model.positiveRate()).assertEqual(40);
      expect(model.averageStars()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0220
     * @tc.name      detail_positive_count_is_zero_when_all_reviews_are_low_022
     * @tc.desc      Verify detail positive count is zero when all reviews are low.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_positive_count_is_zero_when_all_reviews_are_low_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_positive_count_is_zero_when_all_reviews_are_low_022');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([3, 2, 1]), ['black']);
      expect(model.positiveCount()).assertEqual(0);
      expect(model.positiveRate()).assertEqual(0);
      expect(model.commentCount()).assertEqual(3);
      expect(model.averageStars()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0230
     * @tc.name      detail_positive_count_covers_every_review_when_all_are_positive_023
     * @tc.desc      Verify detail positive count covers every review when all are positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_positive_count_covers_every_review_when_all_are_positive_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_positive_count_covers_every_review_when_all_are_positive_023');
      let model: DetailModel = detailWith(galleryOf(2), reviewStars([5, 4, 4]), ['black']);
      expect(model.positiveCount()).assertEqual(3);
      expect(model.positiveCount()).assertEqual(model.commentCount());
      expect(model.positiveRate()).assertEqual(100);
      // 5 + 4 + 4 = 13 over three reviews gives 4.333, kept as the rounded 4.3.
      expect(model.averageStars()).assertEqual(4.3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0240
     * @tc.name      detail_positive_count_treats_four_stars_as_the_boundary_024
     * @tc.desc      Verify detail positive count treats four stars as the boundary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_positive_count_treats_four_stars_as_the_boundary_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_positive_count_treats_four_stars_as_the_boundary_024');
      let model: DetailModel = detailWith(galleryOf(2), reviewStars([4, 4]), ['black']);
      expect(model.positiveCount()).assertEqual(2);
      expect(model.positiveRate()).assertEqual(100);
      // The second model drops each review to 3 stars, one below the cutoff, so no positive survives.
      let lower: DetailModel = detailWith(galleryOf(2), reviewStars([3, 3]), ['black']);
      expect(lower.positiveCount()).assertEqual(0);
      expect(lower.positiveRate()).assertEqual(0);
      expect(lower.averageStars()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0250
     * @tc.name      detail_six_star_review_is_counted_as_positive_025
     * @tc.desc      Verify detail six star review is counted as positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_six_star_review_is_counted_as_positive_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_six_star_review_is_counted_as_positive_025');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([6]), ['black']);
      expect(model.positiveCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(100);
      expect(model.averageStars()).assertEqual(6);
      expect(model.commentCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0260
     * @tc.name      detail_negative_star_review_is_not_positive_026
     * @tc.desc      Verify detail negative star review is not positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_negative_star_review_is_not_positive_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_negative_star_review_is_not_positive_026');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([-1, 5]), ['black']);
      expect(model.commentCount()).assertEqual(2);
      expect(model.positiveCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(50);
      expect(model.averageStars()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0270
     * @tc.name      detail_positive_rate_uses_the_four_star_threshold_027
     * @tc.desc      Verify detail positive rate uses the four star threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_positive_rate_uses_the_four_star_threshold_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_positive_rate_uses_the_four_star_threshold_027');
      // Rows mix 0, 6, 5 and 3 stars; 2 of 3 positives is 66.67, which Math.round lifts to 67.
      let starSets: number[][] = [[0, 6, 5], [5, 3, 3], [5, 4, 3]];
      let positives: number[] = [2, 1, 2];
      let rates: number[] = [67, 33, 67];
      let averages: number[] = [3.7, 3.7, 4];
      expect(starSets.length).assertEqual(rates.length);
      for (let row: number = 0; row < starSets.length; row++) {
        let model: DetailModel = detailWith(galleryOf(1), reviewStars(starSets[row]), ['black']);
        expect(model.positiveCount()).assertEqual(positives[row]);
        expect(model.commentCount()).assertEqual(starSets[row].length);
        expect(model.positiveRate()).assertEqual(rates[row]);
        expect(model.averageStars()).assertEqual(averages[row]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0280
     * @tc.name      detail_fractional_stars_above_four_are_positive_028
     * @tc.desc      Verify detail fractional stars above four are positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_fractional_stars_above_four_are_positive_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_fractional_stars_above_four_are_positive_028');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([4.5, 3]), ['black']);
      expect(model.positiveCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(50);
      expect(model.averageStars()).assertEqual(3.8);
      expect(model.commentCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0290
     * @tc.name      detail_positive_rate_is_half_for_one_of_two_reviews_029
     * @tc.desc      Verify detail positive rate is half for one of two reviews.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_positive_rate_is_half_for_one_of_two_reviews_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_positive_rate_is_half_for_one_of_two_reviews_029');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5, 3]), ['black']);
      expect(model.positiveCount()).assertEqual(1);
      expect(model.commentCount()).assertEqual(2);
      expect(model.positiveRate()).assertEqual(50);
      expect(model.averageStars()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0300
     * @tc.name      detail_positive_rate_rounds_sixths_to_whole_percent_030
     * @tc.desc      Verify detail positive rate rounds sixths to whole percent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_positive_rate_rounds_sixths_to_whole_percent_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_positive_rate_rounds_sixths_to_whole_percent_030');
      // Six reviews give sixth-fractions: 1/6 rounds to 17 and 5/6 to 83, with averages 3.3 and 4.7.
      let starSets: number[][] = [
        [5, 3, 3, 3, 3, 3],
        [5, 5, 5, 5, 5, 3]
      ];
      let positives: number[] = [1, 5];
      let rates: number[] = [17, 83];
      let averages: number[] = [3.3, 4.7];

      expect(starSets.length).assertEqual(rates.length);
      for (let row: number = 0; row < starSets.length; row++) {
        let model: DetailModel = detailWith(galleryOf(1), reviewStars(starSets[row]), ['black']);
        expect(model.positiveCount()).assertEqual(positives[row]);
        expect(model.commentCount()).assertEqual(6);
        expect(model.positiveRate()).assertEqual(rates[row]);
        expect(model.averageStars()).assertEqual(averages[row]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0310
     * @tc.name      detail_average_stars_is_exact_when_total_divides_evenly_031
     * @tc.desc      Verify detail average stars is exact when total divides evenly.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_average_stars_is_exact_when_total_divides_evenly_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_average_stars_is_exact_when_total_divides_evenly_031');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5, 4, 3]), ['black']);
      expect(model.averageStars()).assertEqual(4);
      expect(model.averageStars() > 3.9).assertTrue();
      expect(model.averageStars() < 4.1).assertTrue();
      expect(model.positiveCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0320
     * @tc.name      detail_average_stars_keeps_one_decimal_for_repeating_thirds_032
     * @tc.desc      Verify detail average stars keeps one decimal for repeating thirds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_average_stars_keeps_one_decimal_for_repeating_thirds_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_average_stars_keeps_one_decimal_for_repeating_thirds_032');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5, 4, 4]), ['black']);
      // 13 / 3 is 4.333..., rounded to one decimal and re-multiplied to 43 tenths.
      expect(model.averageStars()).assertEqual(4.3);
      expect(model.averageStars() * 10).assertEqual(43);
      expect(model.commentCount()).assertEqual(3);
      expect(model.positiveCount()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0330
     * @tc.name      detail_average_stars_rounds_repeating_decimal_up_033
     * @tc.desc      Verify detail average stars rounds repeating decimal up.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_average_stars_rounds_repeating_decimal_up_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_average_stars_rounds_repeating_decimal_up_033');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5, 5, 4]), ['black']);
      expect(model.averageStars()).assertEqual(4.7);
      expect(model.averageStars() * 10).assertEqual(47);
      expect(model.positiveCount()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0340
     * @tc.name      detail_average_stars_reports_a_half_step_034
     * @tc.desc      Verify detail average stars reports a half step.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_average_stars_reports_a_half_step_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_average_stars_reports_a_half_step_034');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([4, 5]), ['black']);
      expect(model.averageStars()).assertEqual(4.5);
      expect(model.positiveCount()).assertEqual(2);
      expect(model.positiveRate()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0350
     * @tc.name      detail_average_stars_rounds_a_quarter_step_up_035
     * @tc.desc      Verify detail average stars rounds a quarter step up.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_average_stars_rounds_a_quarter_step_up_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_average_stars_rounds_a_quarter_step_up_035');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5, 4, 4, 4]), ['black']);
      expect(model.averageStars()).assertEqual(4.3);
      expect(model.averageStars() * 10).assertEqual(43);
      expect(model.commentCount()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0360
     * @tc.name      detail_average_stars_handles_low_review_values_036
     * @tc.desc      Verify detail average stars handles low review values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_average_stars_handles_low_review_values_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_average_stars_handles_low_review_values_036');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([1, 2, 2]), ['black']);
      expect(model.averageStars()).assertEqual(1.7);
      expect(model.averageStars() * 10).assertEqual(17);
      expect(model.positiveCount()).assertEqual(0);
      expect(model.positiveRate()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0370
     * @tc.name      detail_average_stars_includes_zero_star_reviews_037
     * @tc.desc      Verify detail average stars includes zero star reviews.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_average_stars_includes_zero_star_reviews_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_average_stars_includes_zero_star_reviews_037');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([0, 5]), ['black']);
      expect(model.averageStars()).assertEqual(2.5);
      expect(model.positiveCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(50);
      expect(model.commentCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0380
     * @tc.name      detail_average_stars_of_a_single_review_is_its_value_038
     * @tc.desc      Verify detail average stars of a single review is its value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_average_stars_of_a_single_review_is_its_value_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_average_stars_of_a_single_review_is_its_value_038');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([3]), ['black']);
      expect(model.averageStars()).assertEqual(3);
      expect(model.positiveCount()).assertEqual(0);
      expect(model.commentCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0390
     * @tc.name      detail_all_zero_star_reviews_report_zero_statistics_039
     * @tc.desc      Verify detail all zero star reviews report zero statistics.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_all_zero_star_reviews_report_zero_statistics_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_all_zero_star_reviews_report_zero_statistics_039');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([0, 0, 0]), ['black']);
      expect(model.averageStars()).assertEqual(0);
      expect(model.positiveCount()).assertEqual(0);
      expect(model.positiveRate()).assertEqual(0);
      expect(model.commentCount()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0400
     * @tc.name      detail_average_stars_can_exceed_five_for_six_star_reviews_040
     * @tc.desc      Verify detail average stars can exceed five for six star reviews.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_average_stars_can_exceed_five_for_six_star_reviews_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_average_stars_can_exceed_five_for_six_star_reviews_040');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([6, 5]), ['black']);
      expect(model.averageStars()).assertEqual(5.5);
      expect(model.averageStars() * 10).assertEqual(55);
      expect(model.positiveRate()).assertEqual(100);
      expect(model.commentCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0410
     * @tc.name      detail_average_stars_can_fall_below_one_for_negative_reviews_041
     * @tc.desc      Verify detail average stars can fall below one for negative reviews.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_average_stars_can_fall_below_one_for_negative_reviews_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_average_stars_can_fall_below_one_for_negative_reviews_041');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([-1, 0]), ['black']);
      // -1 and 0 average to -0.5; a negative star count can never count as positive.
      expect(model.averageStars()).assertEqual(-0.5);
      expect(model.averageStars() * 10).assertEqual(-5);
      expect(model.positiveCount()).assertEqual(0);
      expect(model.positiveRate()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0420
     * @tc.name      detail_average_stars_reaches_five_when_every_review_is_five_042
     * @tc.desc      Verify detail average stars reaches five when every review is five.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_average_stars_reaches_five_when_every_review_is_five_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_average_stars_reaches_five_when_every_review_is_five_042');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5, 5, 5]), ['black']);
      expect(model.averageStars()).assertEqual(5);
      expect(model.positiveRate()).assertEqual(100);
      expect(model.commentCount()).assertEqual(3);
      expect(model.averageStars() * 10).assertEqual(50);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0430
     * @tc.name      detail_average_stars_reaches_one_when_every_review_is_one_043
     * @tc.desc      Verify detail average stars reaches one when every review is one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_average_stars_reaches_one_when_every_review_is_one_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_average_stars_reaches_one_when_every_review_is_one_043');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([1, 1, 1, 1]), ['black']);
      expect(model.averageStars()).assertEqual(1);
      expect(model.averageStars() * 10).assertEqual(10);
      expect(model.positiveCount()).assertEqual(0);
      expect(model.commentCount()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0440
     * @tc.name      detail_select_choice_updates_to_the_last_option_044
     * @tc.desc      Verify detail select choice updates to the last option.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_select_choice_updates_to_the_last_option_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_select_choice_updates_to_the_last_option_044');
      let model: DetailModel = detailWith(galleryOf(2), reviewStars([5]), ['black', 'silver', 'blue']);
      expect(model.selectChoice(2)).assertTrue();
      expect(model.selectedChoice).assertEqual(2);
      expect(model.choiceName()).assertEqual('blue');
      expect(model.choices.length).assertEqual(3);
      expect(model.choices[2]).assertEqual('blue');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0450
     * @tc.name      detail_select_choice_can_return_to_the_first_option_045
     * @tc.desc      Verify detail select choice can return to the first option.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_select_choice_can_return_to_the_first_option_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_select_choice_can_return_to_the_first_option_045');
      let model: DetailModel = detailWith(galleryOf(2), reviewStars([5]), ['black', 'silver', 'blue']);
      expect(model.selectChoice(1)).assertTrue();
      expect(model.choiceName()).assertEqual('silver');
      expect(model.selectChoice(0)).assertTrue();
      expect(model.selectedChoice).assertEqual(0);
      expect(model.choiceName()).assertEqual('black');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0460
     * @tc.name      detail_select_choice_zero_is_accepted_explicitly_046
     * @tc.desc      Verify detail select choice zero is accepted explicitly.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_select_choice_zero_is_accepted_explicitly_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_select_choice_zero_is_accepted_explicitly_046');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), ['black', 'silver']);
      expect(model.selectChoice(0)).assertTrue();
      expect(model.selectedChoice).assertEqual(0);
      expect(model.choiceName()).assertEqual('black');
      // The explicit 0 selection is kept when -1 is rejected as out of range.
      expect(model.selectChoice(-1)).assertFalse();
      expect(model.selectedChoice).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0470
     * @tc.name      detail_select_choice_rejects_negative_indexes_047
     * @tc.desc      Verify detail select choice rejects negative indexes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_select_choice_rejects_negative_indexes_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_select_choice_rejects_negative_indexes_047');
      let model: DetailModel = detailWith(galleryOf(2), reviewStars([5]), ['black', 'silver']);
      let rejected: number[] = [-1, -2, -9];
      for (let index: number = 0; index < rejected.length; index++) {
        expect(model.selectChoice(rejected[index])).assertFalse();
      }
      expect(model.selectedChoice).assertEqual(0);
      expect(model.choiceName()).assertEqual('black');
      expect(model.choices.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0480
     * @tc.name      detail_select_choice_rejects_out_of_range_indexes_048
     * @tc.desc      Verify detail select choice rejects out of range indexes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_select_choice_rejects_out_of_range_indexes_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_select_choice_rejects_out_of_range_indexes_048');
      let model: DetailModel = detailWith(galleryOf(2), reviewStars([5]), ['black', 'silver']);
      let rejected: number[] = [2, 3, 99];
      for (let index: number = 0; index < rejected.length; index++) {
        expect(model.selectChoice(rejected[index])).assertFalse();
      }
      expect(model.selectedChoice).assertEqual(0);
      expect(model.choiceName()).assertEqual('black');
      expect(model.choices.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0490
     * @tc.name      detail_rejected_selection_preserves_the_previous_choice_049
     * @tc.desc      Verify detail rejected selection preserves the previous choice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_rejected_selection_preserves_the_previous_choice_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_rejected_selection_preserves_the_previous_choice_049');
      let model: DetailModel = detailWith(galleryOf(2), reviewStars([5]), ['black', 'silver', 'blue']);
      expect(model.selectChoice(1)).assertTrue();
      expect(model.selectChoice(-1)).assertFalse();
      expect(model.selectChoice(3)).assertFalse();
      expect(model.selectedChoice).assertEqual(1);
      expect(model.choiceName()).assertEqual('silver');
      expect(model.choices[1]).assertEqual('silver');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0500
     * @tc.name      detail_empty_choices_reject_every_selection_index_050
     * @tc.desc      Verify detail empty choices reject every selection index.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_empty_choices_reject_every_selection_index_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_empty_choices_reject_every_selection_index_050');
      let model: DetailModel = detailWith(galleryOf(2), reviewStars([5]), []);
      let attempts: number[] = [0, 1, -1];
      for (let index: number = 0; index < attempts.length; index++) {
        expect(model.selectChoice(attempts[index])).assertFalse();
      }
      expect(model.selectedChoice).assertEqual(-1);
      expect(model.choiceName().length).assertEqual(0);
      expect(model.choices.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0510
     * @tc.name      detail_single_choice_accepts_zero_and_rejects_one_051
     * @tc.desc      Verify detail single choice accepts zero and rejects one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_single_choice_accepts_zero_and_rejects_one_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_single_choice_accepts_zero_and_rejects_one_051');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), ['only']);
      expect(model.selectChoice(0)).assertTrue();
      expect(model.choiceName()).assertEqual('only');
      expect(model.selectChoice(1)).assertFalse();
      expect(model.choiceName()).assertEqual('only');
      expect(model.selectedChoice).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0520
     * @tc.name      detail_choice_name_is_empty_for_an_out_of_range_selection_052
     * @tc.desc      Verify detail choice name is empty for an out of range selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_choice_name_is_empty_for_an_out_of_range_selection_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_choice_name_is_empty_for_an_out_of_range_selection_052');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), ['black', 'silver']);
      // Writing the field directly bypasses selectChoice(), so only choiceName() guards the range.
      model.selectedChoice = 5;
      expect(model.choiceName().length).assertEqual(0);
      model.selectedChoice = -2;
      expect(model.choiceName().length).assertEqual(0);
      expect(model.selectedChoice).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0530
     * @tc.name      detail_repeated_switches_follow_the_latest_selection_053
     * @tc.desc      Verify detail repeated switches follow the latest selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_repeated_switches_follow_the_latest_selection_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_repeated_switches_follow_the_latest_selection_053');
      let choices: string[] = ['black', 'silver', 'blue'];
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), choices);
      expect(model.selectChoice(2)).assertTrue();
      expect(model.choiceName()).assertEqual('blue');
      expect(model.selectChoice(1)).assertTrue();
      expect(model.choiceName()).assertEqual('silver');
      expect(model.selectChoice(0)).assertTrue();
      expect(model.choiceName()).assertEqual('black');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0540
     * @tc.name      detail_switching_selection_does_not_change_the_choice_list_054
     * @tc.desc      Verify detail switching selection does not change the choice list.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_switching_selection_does_not_change_the_choice_list_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_switching_selection_does_not_change_the_choice_list_054');
      let choices: string[] = ['black', 'silver', 'blue'];
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), choices);
      model.selectChoice(2);
      model.selectChoice(0);
      expect(model.choices.length).assertEqual(3);
      expect(model.choices[0]).assertEqual('black');
      expect(model.choices[1]).assertEqual('silver');
      expect(model.choices[2]).assertEqual('blue');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0550
     * @tc.name      detail_empty_string_choice_is_selectable_but_nameless_055
     * @tc.desc      Verify detail empty string choice is selectable but nameless.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_empty_string_choice_is_selectable_but_nameless_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_empty_string_choice_is_selectable_but_nameless_055');
      let choices: string[] = ['', 'silver'];
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), choices);
      expect(model.selectedChoice).assertEqual(0);
      expect(model.choiceName().length).assertEqual(0);
      expect(model.selectChoice(1)).assertTrue();
      expect(model.choiceName()).assertEqual('silver');
      expect(model.choices[0]).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0560
     * @tc.name      detail_choice_name_preserves_supplied_characters_056
     * @tc.desc      Verify detail choice name preserves supplied characters.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_choice_name_preserves_supplied_characters_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_choice_name_preserves_supplied_characters_056');
      let choiceSets: string[][] = [['  black  ', 'silver'], ['red-blue_01', 'silver/grey']];
      // Row one keeps the spaces either side of 'black'; row two keeps the slash in 'silver/grey'.
      let firstNames: string[] = ['  black  ', 'red-blue_01'];
      let secondNames: string[] = ['silver', 'silver/grey'];
      expect(choiceSets.length).assertEqual(firstNames.length);
      for (let row: number = 0; row < choiceSets.length; row++) {
        let choices: string[] = choiceSets[row];
        let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), choices);
        expect(model.choiceName()).assertEqual(firstNames[row]);
        expect(model.choiceName().length).assertEqual(firstNames[row].length);
        expect(model.selectChoice(1)).assertTrue();
        expect(model.choiceName()).assertEqual(secondNames[row]);
        expect(model.choices.length).assertEqual(2);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0570
     * @tc.name      detail_duplicate_choice_entries_remain_individually_selectable_057
     * @tc.desc      Verify detail duplicate choice entries remain individually selectable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_duplicate_choice_entries_remain_individually_selectable_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_duplicate_choice_entries_remain_individually_selectable_057');
      let choices: string[] = ['black', 'black', 'blue'];
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), choices);
      expect(model.selectChoice(1)).assertTrue();
      expect(model.selectedChoice).assertEqual(1);
      expect(model.choiceName()).assertEqual('black');
      expect(model.choices.length).assertEqual(3);
      expect(model.choices[0]).assertEqual(model.choices[1]);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0580
     * @tc.name      detail_tracks_choice_growth_through_the_supplied_array_058
     * @tc.desc      Verify detail tracks choice growth through the supplied array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_tracks_choice_growth_through_the_supplied_array_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_tracks_choice_growth_through_the_supplied_array_058');
      let choices: string[] = ['black'];
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), choices);
      expect(model.selectChoice(1)).assertFalse();
      choices.push('silver');
      expect(model.selectChoice(1)).assertTrue();
      expect(model.choiceName()).assertEqual('silver');
      expect(model.choices.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0590
     * @tc.name      detail_every_valid_choice_index_selects_its_own_name_059
     * @tc.desc      Verify detail every valid choice index selects its own name.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_every_valid_choice_index_selects_its_own_name_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_every_valid_choice_index_selects_its_own_name_059');
      let choices: string[] = ['black', 'silver', 'blue'];
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), choices);
      for (let index: number = 0; index < choices.length; index++) {
        expect(model.selectChoice(index)).assertTrue();
        expect(model.selectedChoice).assertEqual(index);
        expect(model.choiceName()).assertEqual(choices[index]);
      }
      expect(model.choices.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0600
     * @tc.name      detail_choice_name_guards_against_a_shrunk_choice_list_060
     * @tc.desc      Verify detail choice name guards against a shrunk choice list.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_choice_name_guards_against_a_shrunk_choice_list_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_choice_name_guards_against_a_shrunk_choice_list_060');
      let choices: string[] = ['black', 'silver'];
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), choices);
      expect(model.selectChoice(1)).assertTrue();
      // Popping silver leaves index 1 dangling: choiceName() returns empty while choices has length 1.
      choices.pop();
      expect(model.selectedChoice).assertEqual(1);
      expect(model.choiceName().length).assertEqual(0);
      expect(model.choices.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0610
     * @tc.name      detail_large_choice_list_can_select_its_last_entry_061
     * @tc.desc      Verify detail large choice list can select its last entry.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_large_choice_list_can_select_its_last_entry_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_large_choice_list_can_select_its_last_entry_061');
      let choices: string[] = ['c0', 'c1', 'c2', 'c3'];
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), choices);
      expect(model.selectChoice(3)).assertTrue();
      expect(model.selectedChoice).assertEqual(3);
      expect(model.choiceName()).assertEqual('c3');
      expect(model.choices.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0620
     * @tc.name      detail_retains_the_supplied_goods_fields_062
     * @tc.desc      Verify detail retains the supplied goods fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_retains_the_supplied_goods_fields_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_retains_the_supplied_goods_fields_062');
      let goods: Goods = detailGoods();
      let model: DetailModel = new DetailModel(goods, galleryOf(2), reviewStars([5]), ['black']);
      expect(model.goods.id).assertEqual(21);
      expect(model.goods.title).assertEqual('Detail Fixture Phone');
      expect(model.goods.price.cents()).assertEqual(259900);
      expect(model.goods.category).assertEqual(CATEGORY_PHONE);
      expect(model.goods.labels).assertEqual(LABEL_NEW);
      expect(model.goods.stock).assertEqual(12);
      expect(model.goods.rating).assertEqual(5);
      expect(model.goods.hasLiveRoom()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0630
     * @tc.name      detail_shares_the_supplied_goods_instance_063
     * @tc.desc      Verify detail shares the supplied goods instance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_shares_the_supplied_goods_instance_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_shares_the_supplied_goods_instance_063');
      let goods: Goods = detailGoods();
      let model: DetailModel = new DetailModel(goods, galleryOf(1), reviewStars([5]), ['black']);
      // DetailModel keeps the Goods reference, so edits made through goods reach model.goods.
      goods.sales = 777;
      goods.title = 'Renamed Fixture';
      goods.stock = 3;
      expect(model.goods.sales).assertEqual(777);
      expect(model.goods.title).assertEqual('Renamed Fixture');
      expect(model.goods.stock).assertEqual(3);
      expect(model.goods.title).assertEqual(goods.title);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0640
     * @tc.name      detail_keeps_a_goods_without_a_live_room_unchanged_064
     * @tc.desc      Verify detail keeps a goods without a live room unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_keeps_a_goods_without_a_live_room_unchanged_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_keeps_a_goods_without_a_live_room_unchanged_064');
      // createGoods defaults liveRoomId to -1 and stock to 99, so this one has no room but is in stock.
      let goods: Goods = createGoods(30, 'Basic Fixture', 1000, CATEGORY_PHONE);
      let model: DetailModel = new DetailModel(goods, galleryOf(1), reviewStars([5]), ['black']);
      expect(model.goods.hasLiveRoom()).assertFalse();
      expect(model.goods.liveRoomId).assertEqual(-1);
      expect(model.goods.isInStock()).assertTrue();
      expect(model.goods.stock).assertEqual(99);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0650
     * @tc.name      detail_selection_does_not_disturb_gallery_or_review_statistics_065
     * @tc.desc      Verify detail selection does not disturb gallery or review statistics.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_selection_does_not_disturb_gallery_or_review_statistics_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_selection_does_not_disturb_gallery_or_review_statistics_065');
      let model: DetailModel = detailWith(galleryOf(3), reviewStars([5, 4, 2]), ['black', 'silver']);
      let imagesBefore: number = model.imageCount();
      let commentsBefore: number = model.commentCount();
      let positivesBefore: number = model.positiveCount();
      expect(model.selectChoice(1)).assertTrue();
      expect(model.imageCount()).assertEqual(imagesBefore);
      expect(model.commentCount()).assertEqual(commentsBefore);
      expect(model.positiveCount()).assertEqual(positivesBefore);
      // Two of the three reviews are positive: 200 / 3 rounds to 67, unchanged by selecting index 1.
      expect(model.positiveRate()).assertEqual(67);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0660
     * @tc.name      detail_selection_does_not_change_the_goods_fields_066
     * @tc.desc      Verify detail selection does not change the goods fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_selection_does_not_change_the_goods_fields_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_selection_does_not_change_the_goods_fields_066');
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), ['black', 'silver']);
      let title: string = model.goods.title;
      let sales: number = model.goods.sales;
      expect(model.selectChoice(1)).assertTrue();
      expect(model.goods.title).assertEqual(title);
      expect(model.goods.sales).assertEqual(sales);
      expect(model.goods.id).assertEqual(21);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0670
     * @tc.name      detail_statistics_depend_on_stars_not_on_review_text_067
     * @tc.desc      Verify detail statistics depend on stars not on review text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_statistics_depend_on_stars_not_on_review_text_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_statistics_depend_on_stars_not_on_review_text_067');
      // The wording is identical across both models; only the 2 and 3 star counts differ.
      let positiveTexts: DetailModel = detailWith(galleryOf(1), [
        reviewOf('user-a', 'excellent product', 5),
        reviewOf('user-b', 'wonderful purchase', 4)
      ], ['black']);
      let negativeTexts: DetailModel = detailWith(galleryOf(1), [
        reviewOf('user-a', 'excellent product', 2),
        reviewOf('user-b', 'wonderful purchase', 3)
      ], ['black']);
      expect(positiveTexts.positiveCount()).assertEqual(2);
      expect(negativeTexts.positiveCount()).assertEqual(0);
      expect(positiveTexts.commentCount()).assertEqual(negativeTexts.commentCount());
      expect(positiveTexts.averageStars()).assertEqual(4.5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0680
     * @tc.name      detail_statistics_depend_on_stars_not_on_review_user_068
     * @tc.desc      Verify detail statistics depend on stars not on review user.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_statistics_depend_on_stars_not_on_review_user_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_statistics_depend_on_stars_not_on_review_user_068');
      let first: DetailModel = detailWith(galleryOf(1), [
        reviewOf('18800001765', 'review one', 5),
        reviewOf('13900001234', 'review two', 2)
      ], ['black']);
      let second: DetailModel = detailWith(galleryOf(1), [
        reviewOf('16600003456', 'review three', 5),
        reviewOf('17700009012', 'review four', 2)
      ], ['black']);
      expect(first.positiveCount()).assertEqual(second.positiveCount());
      expect(first.positiveRate()).assertEqual(second.positiveRate());
      expect(first.averageStars()).assertEqual(second.averageStars());
      expect(first.comments[0].user.indexOf(second.comments[0].user) < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0690
     * @tc.name      detail_tracks_gallery_shrinkage_through_the_supplied_array_069
     * @tc.desc      Verify detail tracks gallery shrinkage through the supplied array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_tracks_gallery_shrinkage_through_the_supplied_array_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_tracks_gallery_shrinkage_through_the_supplied_array_069');
      let images: string[] = ['first', 'second'];
      let model: DetailModel = detailWith(images, reviewStars([5]), ['black']);
      expect(model.imageCount()).assertEqual(2);
      // imageCount reads the original array, so popping here removes the second image from the model.
      images.pop();
      expect(model.imageCount()).assertEqual(1);
      expect(model.images[0]).assertEqual('first');
      expect(model.images.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0700
     * @tc.name      detail_tracks_review_shrinkage_through_the_supplied_array_070
     * @tc.desc      Verify detail tracks review shrinkage through the supplied array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_tracks_review_shrinkage_through_the_supplied_array_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_tracks_review_shrinkage_through_the_supplied_array_070');
      let reviews: Comment[] = reviewStars([5, 2]);
      let model: DetailModel = detailWith(galleryOf(1), reviews, ['black']);
      expect(model.positiveCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(50);
      // Dropping the 2-star review leaves a lone 5-star one, so the rate climbs from 50 to 100.
      reviews.pop();
      expect(model.commentCount()).assertEqual(1);
      expect(model.positiveCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0710
     * @tc.name      detail_clearing_the_choice_list_invalidates_the_selection_071
     * @tc.desc      Verify detail clearing the choice list invalidates the selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_clearing_the_choice_list_invalidates_the_selection_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_clearing_the_choice_list_invalidates_the_selection_071');
      let choices: string[] = ['black', 'silver'];
      let model: DetailModel = detailWith(galleryOf(1), reviewStars([5]), choices);
      expect(model.selectedChoice).assertEqual(0);
      // Emptying the array does not reset the constructor's selection, so selectedChoice still reads 0.
      choices.splice(0, choices.length);
      expect(model.selectedChoice).assertEqual(0);
      expect(model.choiceName().length).assertEqual(0);
      expect(model.selectChoice(0)).assertFalse();
      expect(model.choices.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0720
     * @tc.name      detail_retains_review_user_and_text_verbatim_072
     * @tc.desc      Verify detail retains review user and text verbatim.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_retains_review_user_and_text_verbatim_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_retains_review_user_and_text_verbatim_072');
      let user: string = '18800001765';
      let text: string = 'battery lasts two days with heavy use';
      let reviews: Comment[] = [reviewOf(user, text, 5)];
      let model: DetailModel = detailWith(galleryOf(1), reviews, ['black']);
      expect(model.comments[0].user).assertEqual(user);
      expect(model.comments[0].text).assertEqual(text);
      expect(model.comments[0].text.length).assertEqual(text.length);
      expect(model.commentCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0730
     * @tc.name      detail_retains_the_review_star_value_073
     * @tc.desc      Verify detail retains the review star value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_retains_the_review_star_value_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_retains_the_review_star_value_073');
      let reviews: Comment[] = [reviewOf('18800001765', 'three star review', 3)];
      let model: DetailModel = detailWith(galleryOf(1), reviews, ['black']);
      expect(model.comments[0].stars).assertEqual(3);
      expect(model.averageStars()).assertEqual(3);
      expect(model.positiveCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0740
     * @tc.name      detail_retains_goods_sales_and_image_index_074
     * @tc.desc      Verify detail retains goods sales and image index.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_retains_goods_sales_and_image_index_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_retains_goods_sales_and_image_index_074');
      let goods: Goods = detailGoods();
      let model: DetailModel = new DetailModel(goods, galleryOf(1), reviewStars([5]), ['black']);
      expect(model.goods.sales).assertEqual(34);
      // createGoods derives imageIndex from the id, so product 21 maps to slot 21 % 8 = 5.
      expect(model.goods.imageIndex).assertEqual(21 % 8);
      expect(model.goods.liveRoomId).assertEqual(2);
      expect(model.goods.isExpensive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0750
     * @tc.name      detail_two_models_keep_independent_selections_075
     * @tc.desc      Verify detail two models keep independent selections.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_two_models_keep_independent_selections_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_two_models_keep_independent_selections_075');
      let first: DetailModel = detailWith(galleryOf(1), reviewStars([5]), ['black', 'silver']);
      let second: DetailModel = detailWith(galleryOf(1), reviewStars([5]), ['red', 'green']);
      expect(first.selectChoice(1)).assertTrue();
      expect(first.selectedChoice).assertEqual(1);
      expect(second.selectedChoice).assertEqual(0);
      expect(second.choiceName()).assertEqual('red');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0760
     * @tc.name      detail_two_models_keep_independent_goods_076
     * @tc.desc      Verify detail two models keep independent goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_two_models_keep_independent_goods_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_two_models_keep_independent_goods_076');
      let first: DetailModel = detailWith(galleryOf(1), reviewStars([5]), ['black']);
      let second: DetailModel = detailWith(galleryOf(1), reviewStars([5]), ['black']);
      // detailWith builds a fresh fixture goods each call, so renaming here cannot reach the second model.
      first.goods.title = 'First Only';
      first.goods.sales = 11;
      expect(second.goods.title).assertEqual('Detail Fixture Phone');
      expect(second.goods.sales).assertEqual(34);
      expect(first.goods.title).assertEqual('First Only');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0770
     * @tc.name      detail_two_models_keep_independent_review_lists_077
     * @tc.desc      Verify detail two models keep independent review lists.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_two_models_keep_independent_review_lists_077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_two_models_keep_independent_review_lists_077');
      let first: DetailModel = detailWith(galleryOf(1), reviewStars([5]), ['black']);
      let second: DetailModel = detailWith(galleryOf(1), reviewStars([2, 2]), ['black']);
      // reviewStars returns a new array per call, so the pushed review stays inside the first model.
      first.comments.push(reviewOf('18800001765', 'extra review', 5));
      expect(first.commentCount()).assertEqual(2);
      expect(second.commentCount()).assertEqual(2);
      expect(second.positiveCount()).assertEqual(0);
      expect(first.positiveCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0780
     * @tc.name      detail_keeps_a_sold_out_goods_attached_078
     * @tc.desc      Verify detail keeps a sold out goods attached.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_keeps_a_sold_out_goods_attached_078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_keeps_a_sold_out_goods_attached_078');
      let goods: Goods = createGoods(31, 'Sold Out Fixture', 1000, CATEGORY_PHONE,
        'sold out', LABEL_NEW, 0);
      let model: DetailModel = new DetailModel(goods, galleryOf(1), reviewStars([5]), ['black']);
      expect(model.goods.isInStock()).assertFalse();
      expect(model.goods.stock).assertEqual(0);
      expect(model.goods.id).assertEqual(31);
      expect(model.goods.title).assertEqual('Sold Out Fixture');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0790
     * @tc.name      detail_gallery_entry_with_empty_string_is_still_counted_079
     * @tc.desc      Verify detail gallery entry with empty string is still counted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_gallery_entry_with_empty_string_is_still_counted_079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_gallery_entry_with_empty_string_is_still_counted_079');
      let images: string[] = ['', 'swiper1'];
      let model: DetailModel = detailWith(images, reviewStars([5]), ['black']);
      expect(model.imageCount()).assertEqual(2);
      expect(model.images[0].length).assertEqual(0);
      expect(model.images[1]).assertEqual('swiper1');
      expect(model.commentCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0800
     * @tc.name      detail_review_with_empty_user_is_still_counted_080
     * @tc.desc      Verify detail review with empty user is still counted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_review_with_empty_user_is_still_counted_080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_review_with_empty_user_is_still_counted_080');
      let reviews: Comment[] = [reviewOf('', 'anonymous review', 5)];
      let model: DetailModel = detailWith(galleryOf(1), reviews, ['black']);
      expect(model.commentCount()).assertEqual(1);
      expect(model.positiveCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(100);
      expect(model.comments[0].user.length).assertEqual(0);
      expect(model.comments[0].text).assertEqual('anonymous review');
      expect(model.averageStars()).assertEqual(5);
      expect(model.comments.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DETAIL_MODEL_0810
     * @tc.name      detail_positive_rate_maps_two_four_review_sets_081
     * @tc.desc      Verify detail positive rate maps two four review sets.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_positive_rate_maps_two_four_review_sets_081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_positive_rate_maps_two_four_review_sets_081');
      // Row one has three 4+ reviews and averages 15 / 4 = 3.75, rounded to 3.8; row two has one.
      let rows: number[][] = [[5, 4, 4, 2], [5, 3, 3, 3]];
      let positives: number[] = [3, 1];
      let rates: number[] = [75, 25];
      let averages: number[] = [3.8, 3.5];
      expect(rows.length).assertEqual(rates.length);
      for (let index: number = 0; index < rows.length; index++) {
        let model: DetailModel = detailWith(galleryOf(1), reviewStars(rows[index]), ['black']);
        expect(model.positiveCount()).assertEqual(positives[index]);
        expect(model.commentCount()).assertEqual(4);
        expect(model.positiveRate()).assertEqual(rates[index]);
        expect(model.averageStars()).assertEqual(averages[index]);
      }
    });

  });
}
