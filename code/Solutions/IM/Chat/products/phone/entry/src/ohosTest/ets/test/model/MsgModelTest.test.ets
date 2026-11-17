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

import { describe, it, expect } from '@ohos/hypium';
import { FriendMoment } from '@ohos/chatlist';
import hilog from '@ohos.hilog';
import { ChatModel, ChatContact, MessageBase, MessageBody, TextMessage, ImageMessage, ImageTextMessage } from '@ohos/chatlist/src/main/ets/viewmodel/MsgBase';

const DOMAIN: number = 0xF811;
const BUNDLE: string = 'Chat_';
const TAG: string = 'MsgBaseTest';
const TYPE_TEXT: number = 1;
const TYPE_IMAGE: number = 2;
const TYPE_TEXT_AND_IMAGE: number = 3;
const TYPE_TEXT_IMAGE: number = 3;

/**
 * 消息、联系人、朋友圈模型矩阵：契约字段、边界取值与引用语义。
 */

async function yieldThread(): Promise<void> {
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 0);
  });
}

export default function msgModelTest(): void {
  describe('MsgModelTest', (): void => {
    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_0100
     * @tc.name      contact_should_keep_user_id_001
     * @tc.desc      Verify ChatContact keeps the user id exactly as passed in.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'contact_should_keep_user_id_001', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_keep_user_id_001, begin');
      await yieldThread();
      hilog.info(DOMAIN, TAG, '%{public}s', 'contact keep user id start');
      const contact: ChatContact = new ChatContact('user_1001', '张三');
      const check1 = contact.userId;
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_keep_user_id_001, value:' + check1);
      expect(check1).assertEqual('user_1001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'contact keep user id end');
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_keep_user_id_001, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_0200
     * @tc.name      contact_should_keep_user_name_002
     * @tc.desc      Verify ChatContact keeps the user name passed in as a string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'contact_should_keep_user_name_002', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_keep_user_name_002, begin');
      await yieldThread();
      const contact: ChatContact = new ChatContact('user_1002', '李四');
      const check1 = contact.userName;
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_keep_user_name_002, value:' + check1);
      expect(check1).assertEqual('李四');
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_keep_user_name_002, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_0300
     * @tc.name      contact_should_own_default_image_003
     * @tc.desc      Verify the user image is populated even when the caller omits it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'contact_should_own_default_image_003', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_own_default_image_003, begin');
      await yieldThread();
      const contact: ChatContact = new ChatContact('user_1003', '王五');
      const check1 = contact.userImage !== undefined;
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_own_default_image_003, value:' + check1);
      expect(check1).assertTrue();
      const check2 = contact.userImage !== null;
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_own_default_image_003, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_own_default_image_003, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_0400
     * @tc.name      contact_should_keep_given_image_004
     * @tc.desc      Verify the explicit image argument overrides the default image.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'contact_should_keep_given_image_004', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_keep_given_image_004, begin');
      await yieldThread();
      const contact: ChatContact = new ChatContact('user_1004', '赵六', 'images/avatar.png');
      const check1 = contact.userImage;
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_keep_given_image_004, value:' + check1);
      expect(check1).assertEqual('images/avatar.png');
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_should_keep_given_image_004, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_0500
     * @tc.name      contact_to_string_should_contain_fields_005
     * @tc.desc      Verify toString joins user id and user name so that logs can locate a contact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'contact_to_string_should_contain_fields_005', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_to_string_should_contain_fields_005, begin');
      await yieldThread();
      const contact: ChatContact = new ChatContact('user_1005', '钱七');
      const text: string = contact.toString();
      const check1 = text;
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_to_string_should_contain_fields_005, value:' + check1);
      expect(check1).assertContain('user_1005');
      const check2 = text;
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_to_string_should_contain_fields_005, value:' + check2);
      expect(check2).assertContain('钱七');
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_to_string_should_contain_fields_005, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_0600
     * @tc.name      moment_should_keep_required_fields_006
     * @tc.desc      Verify FriendMoment keeps id, owner contact and text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moment_should_keep_required_fields_006', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_should_keep_required_fields_006, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('user_2001', '张三');
      const moment: FriendMoment = new FriendMoment('moment_1', owner, '今天天气不错');
      const check1 = moment.id;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_should_keep_required_fields_006, value:' + check1);
      expect(check1).assertEqual('moment_1');
      const check2 = moment.user.userId;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_should_keep_required_fields_006, value:' + check2);
      expect(check2).assertEqual('user_2001');
      const check3 = moment.text;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_should_keep_required_fields_006, value:' + check3);
      expect(check3).assertEqual('今天天气不错');
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_should_keep_required_fields_006, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_0700
     * @tc.name      moment_time_should_default_to_empty_007
     * @tc.desc      Verify the time field is an empty string when the caller omits it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moment_time_should_default_to_empty_007', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_time_should_default_to_empty_007, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('user_2002', '李四');
      const moment: FriendMoment = new FriendMoment('moment_2', owner, '分享');
      const check1 = moment.time;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_time_should_default_to_empty_007, value:' + check1);
      expect(check1).assertEqual('');
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_time_should_default_to_empty_007, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_0800
     * @tc.name      moment_time_should_be_set_when_given_008
     * @tc.desc      Verify the time argument is stored as is.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moment_time_should_be_set_when_given_008', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_time_should_be_set_when_given_008, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('user_2003', '王五');
      const moment: FriendMoment = new FriendMoment('moment_3', owner, '周末愉快', '08:30');
      const check1 = moment.time;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_time_should_be_set_when_given_008, value:' + check1);
      expect(check1).assertEqual('08:30');
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_time_should_be_set_when_given_008, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_0900
     * @tc.name      moment_image_list_should_be_empty_by_default_009
     * @tc.desc      Verify imageList is an empty array when neither list nor media is given.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moment_image_list_should_be_empty_by_default_009', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_be_empty_by_default_009, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('user_2004', '赵六');
      const moment: FriendMoment = new FriendMoment('moment_4', owner, '打卡');
      const check1: number = moment.imageList.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_be_empty_by_default_009, value:' + check1);
      expect(check1).assertEqual(0);
      const check2 = moment.media;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_be_empty_by_default_009, value:' + check2);
      expect(check2).assertEqual('');
      const check3 = moment.mediaPreview;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_be_empty_by_default_009, value:' + check3);
      expect(check3).assertEqual('');
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_be_empty_by_default_009, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_1000
     * @tc.name      moment_image_list_should_be_stored_010
     * @tc.desc      Verify the image list keeps all entries in the given order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moment_image_list_should_be_stored_010', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_be_stored_010, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('user_2005', '钱七');
      const images: string[] = ['pic1.png', 'pic2.png', 'pic3.png'];
      const moment: FriendMoment = new FriendMoment('moment_5', owner, '九宫格', '09:00', images);
      const check1: number = moment.imageList.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_be_stored_010, value:' + check1);
      expect(check1).assertEqual(3);
      const check2 = moment.imageList[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_be_stored_010, value:' + check2);
      expect(check2).assertEqual('pic1.png');
      const check3 = moment.imageList[2];
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_be_stored_010, value:' + check3);
      expect(check3).assertEqual('pic3.png');
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_be_stored_010, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_1100
     * @tc.name      moment_media_should_be_stored_with_preview_011
     * @tc.desc      Verify media and mediaPreview are stored when the moment carries a video.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moment_media_should_be_stored_with_preview_011', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_media_should_be_stored_with_preview_011, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('user_2006', '孙八');
      const moment: FriendMoment = new FriendMoment('moment_6', owner, '视频', '10:00',
        [], 'video_1.mp4', 'preview_1.png');
      const check1 = moment.media;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_media_should_be_stored_with_preview_011, value:' + check1);
      expect(check1).assertEqual('video_1.mp4');
      const check2 = moment.mediaPreview;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_media_should_be_stored_with_preview_011, value:' + check2);
      expect(check2).assertEqual('preview_1.png');
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_media_should_be_stored_with_preview_011, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_1200
     * @tc.name      moment_image_list_should_win_over_media_012
     * @tc.desc      Verify media is ignored when both an image list and a media url are given.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moment_image_list_should_win_over_media_012', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_win_over_media_012, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('user_2007', '张三');
      const images: string[] = ['pic1.png'];
      const moment: FriendMoment = new FriendMoment('moment_7', owner, '组合', '11:00',
        images, 'video_2.mp4', 'preview_2.png');
      const check1: number = moment.imageList.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_win_over_media_012, value:' + check1);
      expect(check1).assertEqual(1);
      const check2 = moment.media;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_win_over_media_012, value:' + check2);
      expect(check2).assertEqual('');
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_image_list_should_win_over_media_012, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_1300
     * @tc.name      moment_to_string_should_contain_id_013
     * @tc.desc      Verify toString contains the moment id for log traceability.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moment_to_string_should_contain_id_013', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_to_string_should_contain_id_013, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('user_2008', '李四');
      const moment: FriendMoment = new FriendMoment('moment_8', owner, '日志');
      const check1 = moment.toString();
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_to_string_should_contain_id_013, value:' + check1);
      expect(check1).assertContain('moment_8');
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_to_string_should_contain_id_013, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_1400
     * @tc.name      text_message_should_keep_text_014
     * @tc.desc      Verify a text message body keeps the text passed in.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'text_message_should_keep_text_014', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'text_message_should_keep_text_014, begin');
      await yieldThread();
      hilog.info(DOMAIN, TAG, '%{public}s', 'text message keep text start');
      const body: TextMessage = new TextMessage('hello');
      const check1 = body.msg;
      hilog.info(DOMAIN, TAG, BUNDLE + 'text_message_should_keep_text_014, value:' + check1);
      expect(check1).assertEqual('hello');
      hilog.info(DOMAIN, TAG, '%{public}s', 'text message keep text end');
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'text_message_should_keep_text_014, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_1500
     * @tc.name      image_message_should_keep_dimensions_015
     * @tc.desc      Verify an image message body keeps width and height exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'image_message_should_keep_dimensions_015', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_message_should_keep_dimensions_015, begin');
      await yieldThread();
      const body: ImageMessage = new ImageMessage(120, 80, 'pic.png');
      const check1 = body.height;
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_message_should_keep_dimensions_015, value:' + check1);
      expect(check1).assertEqual(120);
      const check2 = body.width;
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_message_should_keep_dimensions_015, value:' + check2);
      expect(check2).assertEqual(80);
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_message_should_keep_dimensions_015, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_1600
     * @tc.name      image_message_should_keep_path_016
     * @tc.desc      Verify an image message body keeps the image path.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'image_message_should_keep_path_016', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_message_should_keep_path_016, begin');
      await yieldThread();
      const body: ImageMessage = new ImageMessage(120, 80, 'images/photo.png');
      const check1 = body.image;
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_message_should_keep_path_016, value:' + check1);
      expect(check1).assertEqual('images/photo.png');
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_message_should_keep_path_016, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_1700
     * @tc.name      image_text_message_should_keep_all_fields_017
     * @tc.desc      Verify a combined image-text body keeps image, text and dimensions together.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'image_text_message_should_keep_all_fields_017', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_text_message_should_keep_all_fields_017, begin');
      await yieldThread();
      const body: ImageTextMessage = new ImageTextMessage(200, 100, 'cover.png', 'news');
      const check1 = body.height;
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_text_message_should_keep_all_fields_017, value:' + check1);
      expect(check1).assertEqual(200);
      const check2 = body.width;
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_text_message_should_keep_all_fields_017, value:' + check2);
      expect(check2).assertEqual(100);
      const check3 = body.image;
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_text_message_should_keep_all_fields_017, value:' + check3);
      expect(check3).assertEqual('cover.png');
      const check4 = body.msg;
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_text_message_should_keep_all_fields_017, value:' + check4);
      expect(check4).assertEqual('news');
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_text_message_should_keep_all_fields_017, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_1800
     * @tc.name      message_base_should_keep_participants_018
     * @tc.desc      Verify MessageBase keeps the sender and receiver contacts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_base_should_keep_participants_018', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_should_keep_participants_018, begin');
      await yieldThread();
      const from: ChatContact = new ChatContact('user_a', '张三');
      const to: ChatContact = new ChatContact('user_b', '李四');
      const message: MessageBase = new MessageBase('msg_1', from, to, new TextMessage('hi'), TYPE_TEXT);
      const check1 = message.msgId;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_should_keep_participants_018, value:' + check1);
      expect(check1).assertEqual('msg_1');
      const check2 = message.from.userId;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_should_keep_participants_018, value:' + check2);
      expect(check2).assertEqual('user_a');
      const check3 = message.to.userId;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_should_keep_participants_018, value:' + check3);
      expect(check3).assertEqual('user_b');
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_should_keep_participants_018, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_1900
     * @tc.name      message_base_time_should_default_to_zero_019
     * @tc.desc      Verify the message time defaults to zero when the caller omits it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_base_time_should_default_to_zero_019', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_time_should_default_to_zero_019, begin');
      await yieldThread();
      const message: MessageBase = new MessageBase('msg_2',
        new ChatContact('user_a', '张三'), new ChatContact('user_b', '李四'), new TextMessage('hi'), TYPE_TEXT);
      const check1 = message.msgTime;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_time_should_default_to_zero_019, value:' + check1);
      expect(check1).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_time_should_default_to_zero_019, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_2000
     * @tc.name      message_base_time_should_be_set_020
     * @tc.desc      Verify the explicit timestamp is stored unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_base_time_should_be_set_020', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_time_should_be_set_020, begin');
      await yieldThread();
      const message: MessageBase = new MessageBase('msg_3',
        new ChatContact('user_a', '张三'), new ChatContact('user_b', '李四'),
        new TextMessage('hi'), TYPE_TEXT, 1700000000000);
      const check1 = message.msgTime;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_time_should_be_set_020, value:' + check1);
      expect(check1).assertEqual(1700000000000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_time_should_be_set_020, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_2100
     * @tc.name      message_base_type_should_be_stored_021
     * @tc.desc      Verify the message type distinguishes image messages from text messages.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_base_type_should_be_stored_021', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_type_should_be_stored_021, begin');
      await yieldThread();
      const textMessage: MessageBase = new MessageBase('msg_4',
        new ChatContact('user_a', '张三'), new ChatContact('user_b', '李四'), new TextMessage('hi'), TYPE_TEXT);
      const imageMessage: MessageBase = new MessageBase('msg_5',
        new ChatContact('user_a', '张三'), new ChatContact('user_b', '李四'),
        new ImageMessage(10, 10, 'a.png'), TYPE_IMAGE);
      const check1 = textMessage.msgType;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_type_should_be_stored_021, value:' + check1);
      expect(check1).assertEqual(TYPE_TEXT);
      const check2 = imageMessage.msgType;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_type_should_be_stored_021, value:' + check2);
      expect(check2).assertEqual(TYPE_IMAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_type_should_be_stored_021, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_2200
     * @tc.name      message_base_body_should_be_text_instance_022
     * @tc.desc      Verify the body keeps the concrete message body type, not a copy.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_base_body_should_be_text_instance_022', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_body_should_be_text_instance_022, begin');
      await yieldThread();
      const body: TextMessage = new TextMessage('payload');
      const message: MessageBase = new MessageBase('msg_6',
        new ChatContact('user_a', '张三'), new ChatContact('user_b', '李四'), body, TYPE_TEXT);
      const check1 = message.msgBody instanceof TextMessage;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_body_should_be_text_instance_022, value:' + check1);
      expect(check1).assertTrue();
      const check2 = (message.msgBody as TextMessage).msg;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_body_should_be_text_instance_022, value:' + check2);
      expect(check2).assertEqual('payload');
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_body_should_be_text_instance_022, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_2300
     * @tc.name      message_body_base_should_accept_subclass_023
     * @tc.desc      Verify MessageBody can hold a subclass instance without losing its dynamic type.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_body_base_should_accept_subclass_023', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_body_base_should_accept_subclass_023, begin');
      await yieldThread();
      const body: MessageBody = new TextMessage('raw');
      const check1 = body instanceof TextMessage;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_body_base_should_accept_subclass_023, value:' + check1);
      expect(check1).assertTrue();
      const check2 = (body as TextMessage).msg;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_body_base_should_accept_subclass_023, value:' + check2);
      expect(check2).assertEqual('raw');
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_body_base_should_accept_subclass_023, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_2400
     * @tc.name      chat_model_should_keep_last_message_024
     * @tc.desc      Verify ChatModel keeps the conversation preview text and time.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_model_should_keep_last_message_024', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_keep_last_message_024, begin');
      await yieldThread();
      const model: ChatModel = new ChatModel(new ChatContact('user_1', '张三'), '在吗', '10:30', 2);
      const check1 = model.lastMsg;
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_keep_last_message_024, value:' + check1);
      expect(check1).assertEqual('在吗');
      const check2 = model.lastTime;
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_keep_last_message_024, value:' + check2);
      expect(check2).assertEqual('10:30');
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_keep_last_message_024, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_2500
     * @tc.name      chat_model_should_keep_unread_count_025
     * @tc.desc      Verify the unread counter keeps zero and positive values unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_model_should_keep_unread_count_025', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_keep_unread_count_025, begin');
      await yieldThread();
      const zeroModel: ChatModel = new ChatModel(new ChatContact('user_1', '张三'), 'hi', '10:00', 0);
      const unreadModel: ChatModel = new ChatModel(new ChatContact('user_2', '李四'), 'hi', '10:01', 9);
      const check1 = zeroModel.unreadMsgCount;
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_keep_unread_count_025, value:' + check1);
      expect(check1).assertEqual(0);
      const check2 = unreadModel.unreadMsgCount;
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_keep_unread_count_025, value:' + check2);
      expect(check2).assertEqual(9);
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_keep_unread_count_025, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_2600
     * @tc.name      chat_model_should_reuse_contact_reference_026
     * @tc.desc      Verify ChatModel keeps the same contact instance instead of copying it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_model_should_reuse_contact_reference_026', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_reuse_contact_reference_026, begin');
      await yieldThread();
      const contact: ChatContact = new ChatContact('user_1', '张三');
      const model: ChatModel = new ChatModel(contact, 'hi', '10:00', 0);
      const check1 = model.user === contact;
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_reuse_contact_reference_026, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_reuse_contact_reference_026, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_2700
     * @tc.name      text_message_should_be_message_body_027
     * @tc.desc      Verify TextMessage is assignable to the MessageBody base type.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'text_message_should_be_message_body_027', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'text_message_should_be_message_body_027, begin');
      await yieldThread();
      hilog.info(DOMAIN, TAG, '%{public}s', 'text message poly start');
      const body: MessageBody = new TextMessage('t');
      const check1 = body instanceof TextMessage;
      hilog.info(DOMAIN, TAG, BUNDLE + 'text_message_should_be_message_body_027, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'text message poly end');
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'text_message_should_be_message_body_027, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_2800
     * @tc.name      image_message_should_be_message_body_028
     * @tc.desc      Verify ImageMessage is assignable to the MessageBody base type.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'image_message_should_be_message_body_028', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_message_should_be_message_body_028, begin');
      await yieldThread();
      const body: MessageBody = new ImageMessage(10, 10, 'a.png');
      const check1 = body instanceof ImageMessage;
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_message_should_be_message_body_028, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_message_should_be_message_body_028, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_2900
     * @tc.name      image_text_message_should_be_message_body_029
     * @tc.desc      Verify ImageTextMessage is assignable to the MessageBody base type.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'image_text_message_should_be_message_body_029', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_text_message_should_be_message_body_029, begin');
      await yieldThread();
      const body: MessageBody = new ImageTextMessage(10, 10, 'a.png', 't');
      const check1 = body instanceof ImageTextMessage;
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_text_message_should_be_message_body_029, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'image_text_message_should_be_message_body_029, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_3000
     * @tc.name      text_body_should_not_be_image_body_030
     * @tc.desc      Verify a text body is not reported as an image body.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'text_body_should_not_be_image_body_030', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'text_body_should_not_be_image_body_030, begin');
      await yieldThread();
      const body: MessageBody = new TextMessage('t');
      const check1 = body instanceof ImageMessage;
      hilog.info(DOMAIN, TAG, BUNDLE + 'text_body_should_not_be_image_body_030, value:' + check1);
      expect(check1).assertFalse();
      hilog.info(DOMAIN, TAG, BUNDLE + 'text_body_should_not_be_image_body_030, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_3100
     * @tc.name      message_with_text_body_should_expose_text_031
     * @tc.desc      Verify a text message exposes its payload through the base container.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_with_text_body_should_expose_text_031', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_with_text_body_should_expose_text_031, begin');
      await yieldThread();
      const message: MessageBase = new MessageBase('m', new ChatContact('a', 'A'),
        new ChatContact('b', 'B'), new TextMessage('payload'), TYPE_TEXT);
      const check1 = (message.msgBody as TextMessage).msg;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_with_text_body_should_expose_text_031, value:' + check1);
      expect(check1).assertEqual('payload');
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_with_text_body_should_expose_text_031, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_3200
     * @tc.name      message_with_image_body_should_expose_size_032
     * @tc.desc      Verify an image message exposes its dimensions through the base container.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_with_image_body_should_expose_size_032', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_with_image_body_should_expose_size_032, begin');
      await yieldThread();
      const message: MessageBase = new MessageBase('m', new ChatContact('a', 'A'),
        new ChatContact('b', 'B'), new ImageMessage(640, 480, 'p.png'), TYPE_IMAGE);
      const body: ImageMessage = message.msgBody as ImageMessage;
      const check1 = body.height;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_with_image_body_should_expose_size_032, value:' + check1);
      expect(check1).assertEqual(640);
      const check2 = body.width;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_with_image_body_should_expose_size_032, value:' + check2);
      expect(check2).assertEqual(480);
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_with_image_body_should_expose_size_032, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_3300
     * @tc.name      message_with_image_text_body_should_expose_both_033
     * @tc.desc      Verify a combined message exposes image and text fields together.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_with_image_text_body_should_expose_both_033', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_with_image_text_body_should_expose_both_033, begin');
      await yieldThread();
      const message: MessageBase = new MessageBase('m', new ChatContact('a', 'A'),
        new ChatContact('b', 'B'), new ImageTextMessage(10, 20, 'p.png', 'x'), TYPE_TEXT_IMAGE);
      const body: ImageTextMessage = message.msgBody as ImageTextMessage;
      const check1 = body.msg;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_with_image_text_body_should_expose_both_033, value:' + check1);
      expect(check1).assertEqual('x');
      const check2 = body.image;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_with_image_text_body_should_expose_both_033, value:' + check2);
      expect(check2).assertEqual('p.png');
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_with_image_text_body_should_expose_both_033, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_3400
     * @tc.name      chat_model_should_reuse_contact_instance_034
     * @tc.desc      Verify ChatModel stores the same contact object it receives.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_model_should_reuse_contact_instance_034', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_reuse_contact_instance_034, begin');
      await yieldThread();
      const contact: ChatContact = new ChatContact('u1', '张三');
      const model: ChatModel = new ChatModel(contact, 'hi', '10:00', 3);
      const check1 = model.user === contact;
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_reuse_contact_instance_034, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_reuse_contact_instance_034, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_3500
     * @tc.name      chat_model_should_keep_zero_unread_035
     * @tc.desc      Verify a zero unread counter is preserved rather than overwritten.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_model_should_keep_zero_unread_035', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_keep_zero_unread_035, begin');
      await yieldThread();
      const model: ChatModel = new ChatModel(new ChatContact('u1', '张三'), 'hi', '10:00', 0);
      const check1 = model.unreadMsgCount === 0;
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_keep_zero_unread_035, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_should_keep_zero_unread_035, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_3600
     * @tc.name      contact_to_string_should_contain_image_036
     * @tc.desc      Verify the diagnostic string includes the image field.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'contact_to_string_should_contain_image_036', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_to_string_should_contain_image_036, begin');
      await yieldThread();
      const contact: ChatContact = new ChatContact('u1', '张三', 'avatar.png');
      const check1 = contact.toString();
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_to_string_should_contain_image_036, value:' + check1);
      expect(check1).assertContain('avatar.png');
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_to_string_should_contain_image_036, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_3700
     * @tc.name      message_base_should_keep_body_reference_037
     * @tc.desc      Verify the body object is stored by reference, not copied.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_base_should_keep_body_reference_037', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_should_keep_body_reference_037, begin');
      await yieldThread();
      const body: TextMessage = new TextMessage('ref');
      const message: MessageBase = new MessageBase('m', new ChatContact('a', 'A'),
        new ChatContact('b', 'B'), body, TYPE_TEXT);
      const check1 = message.msgBody === body;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_should_keep_body_reference_037, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_should_keep_body_reference_037, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_3800
     * @tc.name      message_base_should_keep_zero_time_038
     * @tc.desc      Verify an explicit zero timestamp is preserved.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_base_should_keep_zero_time_038', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_should_keep_zero_time_038, begin');
      await yieldThread();
      const message: MessageBase = new MessageBase('m', new ChatContact('a', 'A'),
        new ChatContact('b', 'B'), new TextMessage('t'), TYPE_TEXT, 0);
      const check1 = message.msgTime === 0;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_should_keep_zero_time_038, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_base_should_keep_zero_time_038, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_3900
     * @tc.name      friend_moment_text_sample_039
     * @tc.desc      Verify FriendMoment keeps text sample 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_text_sample_039', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_039, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, '');
      const check1 = moment.text;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_039, value:' + check1);
      expect(check1).assertEqual('');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_039, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_4000
     * @tc.name      friend_moment_text_sample_040
     * @tc.desc      Verify FriendMoment keeps text sample 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_text_sample_040', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_040, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 'a');
      const check1 = moment.text;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_040, value:' + check1);
      expect(check1).assertEqual('a');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_040, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_4100
     * @tc.name      friend_moment_text_sample_041
     * @tc.desc      Verify FriendMoment keeps text sample 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_text_sample_041', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_041, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, '中文');
      const check1 = moment.text;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_041, value:' + check1);
      expect(check1).assertEqual('中文');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_041, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_4200
     * @tc.name      friend_moment_text_sample_042
     * @tc.desc      Verify FriendMoment keeps text sample 3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_text_sample_042', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_042, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, '今天天气不错');
      const check1 = moment.text;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_042, value:' + check1);
      expect(check1).assertEqual('今天天气不错');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_042, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_4300
     * @tc.name      friend_moment_text_sample_043
     * @tc.desc      Verify FriendMoment keeps text sample 4.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_text_sample_043', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_043, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 'a b c');
      const check1 = moment.text;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_043, value:' + check1);
      expect(check1).assertEqual('a b c');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_043, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_4400
     * @tc.name      friend_moment_text_sample_044
     * @tc.desc      Verify FriendMoment keeps text sample 5.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_text_sample_044', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_044, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, '!@#$%^&*()');
      const check1 = moment.text;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_044, value:' + check1);
      expect(check1).assertEqual('!@#$%^&*()');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_044, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_4500
     * @tc.name      friend_moment_text_sample_045
     * @tc.desc      Verify FriendMoment keeps text sample 6.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_text_sample_045', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_045, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const check1 = moment.text;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_045, value:' + check1);
      expect(check1).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_045, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_4600
     * @tc.name      friend_moment_text_sample_046
     * @tc.desc      Verify FriendMoment keeps text sample 7.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_text_sample_046', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_046, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
      const check1 = moment.text;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_046, value:' + check1);
      expect(check1).assertEqual('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_text_sample_046, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_4700
     * @tc.name      friend_moment_time_sample_047
     * @tc.desc      Verify FriendMoment keeps time sample 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_time_sample_047', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_time_sample_047, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '');
      const check1 = moment.time;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_time_sample_047, value:' + check1);
      expect(check1).assertEqual('');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_time_sample_047, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_4800
     * @tc.name      friend_moment_time_sample_048
     * @tc.desc      Verify FriendMoment keeps time sample 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_time_sample_048', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_time_sample_048, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '08:30');
      const check1 = moment.time;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_time_sample_048, value:' + check1);
      expect(check1).assertEqual('08:30');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_time_sample_048, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_4900
     * @tc.name      friend_moment_time_sample_049
     * @tc.desc      Verify FriendMoment keeps time sample 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_time_sample_049', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_time_sample_049, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '23:59');
      const check1 = moment.time;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_time_sample_049, value:' + check1);
      expect(check1).assertEqual('23:59');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_time_sample_049, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_5000
     * @tc.name      friend_moment_time_sample_050
     * @tc.desc      Verify FriendMoment keeps time sample 3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_time_sample_050', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_time_sample_050, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '2026-11-14 10:00');
      const check1 = moment.time;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_time_sample_050, value:' + check1);
      expect(check1).assertEqual('2026-11-14 10:00');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_time_sample_050, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_5100
     * @tc.name      friend_moment_image_list_size_051
     * @tc.desc      Verify FriendMoment keeps an image list of size 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_image_list_size_051', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_051, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const images: string[] = [];
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '08:00', images);
      const check1: number = moment.imageList.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_051, value:' + check1);
      expect(check1).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_051, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_5200
     * @tc.name      friend_moment_image_list_size_052
     * @tc.desc      Verify FriendMoment keeps an image list of size 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_image_list_size_052', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_052, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const images: string[] = ['p0.png'];
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '08:00', images);
      const check1: number = moment.imageList.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_052, value:' + check1);
      expect(check1).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_052, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_5300
     * @tc.name      friend_moment_image_list_size_053
     * @tc.desc      Verify FriendMoment keeps an image list of size 3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_image_list_size_053', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_053, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const images: string[] = ['p0.png','p1.png','p2.png'];
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '08:00', images);
      const check1: number = moment.imageList.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_053, value:' + check1);
      expect(check1).assertEqual(3);
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_053, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_5400
     * @tc.name      friend_moment_image_list_size_054
     * @tc.desc      Verify FriendMoment keeps an image list of size 9.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_image_list_size_054', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_054, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const images: string[] = ['p0.png','p1.png','p2.png','p3.png','p4.png','p5.png','p6.png','p7.png','p8.png'];
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '08:00', images);
      const check1: number = moment.imageList.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_054, value:' + check1);
      expect(check1).assertEqual(9);
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_054, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_5500
     * @tc.name      friend_moment_image_list_size_055
     * @tc.desc      Verify FriendMoment keeps an image list of size 12.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_image_list_size_055', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_055, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const images: string[] = ['p0.png','p1.png','p2.png','p3.png','p4.png','p5.png','p6.png','p7.png','p8.png','p9.png','p10.png','p11.png'];
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '08:00', images);
      const check1: number = moment.imageList.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_055, value:' + check1);
      expect(check1).assertEqual(12);
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_image_list_size_055, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_5600
     * @tc.name      friend_moment_media_sample_056
     * @tc.desc      Verify FriendMoment stores media sample 0 together with its preview.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_media_sample_056', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_media_sample_056, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '08:00', [], 'v1.mp4', 'p1.png');
      const check1 = moment.media;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_media_sample_056, value:' + check1);
      expect(check1).assertEqual('v1.mp4');
      const check2 = moment.mediaPreview;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_media_sample_056, value:' + check2);
      expect(check2).assertEqual('p1.png');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_media_sample_056, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_5700
     * @tc.name      friend_moment_media_sample_057
     * @tc.desc      Verify FriendMoment stores media sample 1 together with its preview.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_media_sample_057', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_media_sample_057, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '08:00', [], 'v2.mp4', '');
      const check1 = moment.media;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_media_sample_057, value:' + check1);
      expect(check1).assertEqual('v2.mp4');
      const check2 = moment.mediaPreview;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_media_sample_057, value:' + check2);
      expect(check2).assertEqual('');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_media_sample_057, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_5800
     * @tc.name      friend_moment_media_sample_058
     * @tc.desc      Verify FriendMoment stores media sample 2 together with its preview.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_media_sample_058', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_media_sample_058, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '08:00', [], '', '');
      const check1 = moment.media;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_media_sample_058, value:' + check1);
      expect(check1).assertEqual('');
      const check2 = moment.mediaPreview;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_media_sample_058, value:' + check2);
      expect(check2).assertEqual('');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_media_sample_058, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_5900
     * @tc.name      friend_moment_list_should_win_over_media_059
     * @tc.desc      Verify an image list suppresses the media url when both are supplied.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_list_should_win_over_media_059', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_list_should_win_over_media_059, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const images: string[] = ['p0.png', 'p1.png'];
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '08:00', images, 'v.mp4', 'p.png');
      const check1: number = moment.imageList.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_list_should_win_over_media_059, value:' + check1);
      expect(check1).assertEqual(2);
      const check2 = moment.media;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_list_should_win_over_media_059, value:' + check2);
      expect(check2).assertEqual('');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_list_should_win_over_media_059, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_6000
     * @tc.name      friend_moment_empty_list_should_fall_back_to_media_060
     * @tc.desc      Verify an empty image list falls back to the media url branch.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_empty_list_should_fall_back_to_media_060', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_empty_list_should_fall_back_to_media_060, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 't', '08:00', [], 'v.mp4', 'p.png');
      const check1: number = moment.imageList.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_empty_list_should_fall_back_to_media_060, value:' + check1);
      expect(check1).assertEqual(0);
      const check2 = moment.media;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_empty_list_should_fall_back_to_media_060, value:' + check2);
      expect(check2).assertEqual('v.mp4');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_empty_list_should_fall_back_to_media_060, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_6100
     * @tc.name      friend_moment_id_sample_061
     * @tc.desc      Verify FriendMoment keeps id sample 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_id_sample_061', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_id_sample_061, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('', owner, 't');
      const check1 = moment.id;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_id_sample_061, value:' + check1);
      expect(check1).assertEqual('');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_id_sample_061, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_6200
     * @tc.name      friend_moment_id_sample_062
     * @tc.desc      Verify FriendMoment keeps id sample 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_id_sample_062', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_id_sample_062, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('moment_1', owner, 't');
      const check1 = moment.id;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_id_sample_062, value:' + check1);
      expect(check1).assertEqual('moment_1');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_id_sample_062, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_6300
     * @tc.name      friend_moment_id_sample_063
     * @tc.desc      Verify FriendMoment keeps id sample 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_id_sample_063', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_id_sample_063, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', owner, 't');
      const check1 = moment.id;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_id_sample_063, value:' + check1);
      expect(check1).assertEqual('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_id_sample_063, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_6400
     * @tc.name      friend_moment_should_reuse_owner_reference_064
     * @tc.desc      Verify FriendMoment keeps the same owner contact instance.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_should_reuse_owner_reference_064', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_should_reuse_owner_reference_064, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('m', owner, 't');
      const check1 = moment.user === owner;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_should_reuse_owner_reference_064, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_should_reuse_owner_reference_064, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MSGMODEL_6500
     * @tc.name      friend_moment_to_string_should_contain_id_065
     * @tc.desc      Verify FriendMoment toString keeps the moment id for traceability.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_to_string_should_contain_id_065', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_to_string_should_contain_id_065, begin');
      await yieldThread();
      const owner: ChatContact = new ChatContact('u1', 'A');
      const moment: FriendMoment = new FriendMoment('moment_9', owner, 't');
      const check1 = moment.toString();
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_to_string_should_contain_id_065, value:' + check1);
      expect(check1).assertContain('moment_9');
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_to_string_should_contain_id_065, end');
    });  });
}
