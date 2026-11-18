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
import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

import { UserRepository } from '../../../main/ets/common/Repository';
import { User } from '../../../main/ets/common/Types';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_USER_REPO]';

export default function UserRepositoryMatrixTest(): void {
  describe('UserRepositoryMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0001
     * @tc.name      testUserRepositoryMatrix0001
     * @tc.desc      createUser/UserRepository/UserService keep id -5 and name #1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0001 begin');
      const id: number = -5;
      const name: string = "";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0002
     * @tc.name      testUserRepositoryMatrix0002
     * @tc.desc      createUser/UserRepository/UserService keep id -5 and name #2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0002 begin');
      const id: number = -5;
      const name: string = "Alice";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0003
     * @tc.name      testUserRepositoryMatrix0003
     * @tc.desc      createUser/UserRepository/UserService keep id -5 and name #3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0003 begin');
      const id: number = -5;
      const name: string = "Bob";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0004
     * @tc.name      testUserRepositoryMatrix0004
     * @tc.desc      createUser/UserRepository/UserService keep id -5 and name #4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0004 begin');
      const id: number = -5;
      const name: string = "中文";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0005
     * @tc.name      testUserRepositoryMatrix0005
     * @tc.desc      createUser/UserRepository/UserService keep id -5 and name #5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0005 begin');
      const id: number = -5;
      const name: string = "a b";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0006
     * @tc.name      testUserRepositoryMatrix0006
     * @tc.desc      createUser/UserRepository/UserService keep id -1 and name #6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0006 begin');
      const id: number = -1;
      const name: string = "";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0007
     * @tc.name      testUserRepositoryMatrix0007
     * @tc.desc      createUser/UserRepository/UserService keep id -1 and name #7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0007 begin');
      const id: number = -1;
      const name: string = "Alice";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0008
     * @tc.name      testUserRepositoryMatrix0008
     * @tc.desc      createUser/UserRepository/UserService keep id -1 and name #8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0008 begin');
      const id: number = -1;
      const name: string = "Bob";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0009
     * @tc.name      testUserRepositoryMatrix0009
     * @tc.desc      createUser/UserRepository/UserService keep id -1 and name #9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0009 begin');
      const id: number = -1;
      const name: string = "中文";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0010
     * @tc.name      testUserRepositoryMatrix0010
     * @tc.desc      createUser/UserRepository/UserService keep id -1 and name #10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0010 begin');
      const id: number = -1;
      const name: string = "a b";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0011
     * @tc.name      testUserRepositoryMatrix0011
     * @tc.desc      createUser/UserRepository/UserService keep id 0 and name #11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0011 begin');
      const id: number = 0;
      const name: string = "";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0012
     * @tc.name      testUserRepositoryMatrix0012
     * @tc.desc      createUser/UserRepository/UserService keep id 0 and name #12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0012 begin');
      const id: number = 0;
      const name: string = "Alice";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0013
     * @tc.name      testUserRepositoryMatrix0013
     * @tc.desc      createUser/UserRepository/UserService keep id 0 and name #13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0013 begin');
      const id: number = 0;
      const name: string = "Bob";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0014
     * @tc.name      testUserRepositoryMatrix0014
     * @tc.desc      createUser/UserRepository/UserService keep id 0 and name #14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0014 begin');
      const id: number = 0;
      const name: string = "中文";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0015
     * @tc.name      testUserRepositoryMatrix0015
     * @tc.desc      createUser/UserRepository/UserService keep id 0 and name #15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0015 begin');
      const id: number = 0;
      const name: string = "a b";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0016
     * @tc.name      testUserRepositoryMatrix0016
     * @tc.desc      createUser/UserRepository/UserService keep id 1 and name #16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0016 begin');
      const id: number = 1;
      const name: string = "";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0017
     * @tc.name      testUserRepositoryMatrix0017
     * @tc.desc      createUser/UserRepository/UserService keep id 1 and name #17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0017 begin');
      const id: number = 1;
      const name: string = "Alice";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0018
     * @tc.name      testUserRepositoryMatrix0018
     * @tc.desc      createUser/UserRepository/UserService keep id 1 and name #18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0018 begin');
      const id: number = 1;
      const name: string = "Bob";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0019
     * @tc.name      testUserRepositoryMatrix0019
     * @tc.desc      createUser/UserRepository/UserService keep id 1 and name #19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0019 begin');
      const id: number = 1;
      const name: string = "中文";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0020
     * @tc.name      testUserRepositoryMatrix0020
     * @tc.desc      createUser/UserRepository/UserService keep id 1 and name #20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0020 begin');
      const id: number = 1;
      const name: string = "a b";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0020 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0021
     * @tc.name      testUserRepositoryMatrix0021
     * @tc.desc      createUser/UserRepository/UserService keep id 2 and name #21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0021 begin');
      const id: number = 2;
      const name: string = "";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0021 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0022
     * @tc.name      testUserRepositoryMatrix0022
     * @tc.desc      createUser/UserRepository/UserService keep id 2 and name #22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0022 begin');
      const id: number = 2;
      const name: string = "Alice";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0022 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0023
     * @tc.name      testUserRepositoryMatrix0023
     * @tc.desc      createUser/UserRepository/UserService keep id 2 and name #23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0023 begin');
      const id: number = 2;
      const name: string = "Bob";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0023 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0024
     * @tc.name      testUserRepositoryMatrix0024
     * @tc.desc      createUser/UserRepository/UserService keep id 2 and name #24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0024 begin');
      const id: number = 2;
      const name: string = "中文";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0024 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0025
     * @tc.name      testUserRepositoryMatrix0025
     * @tc.desc      createUser/UserRepository/UserService keep id 2 and name #25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0025 begin');
      const id: number = 2;
      const name: string = "a b";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0025 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0026
     * @tc.name      testUserRepositoryMatrix0026
     * @tc.desc      createUser/UserRepository/UserService keep id 10 and name #26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0026 begin');
      const id: number = 10;
      const name: string = "";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0026 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0027
     * @tc.name      testUserRepositoryMatrix0027
     * @tc.desc      createUser/UserRepository/UserService keep id 10 and name #27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0027 begin');
      const id: number = 10;
      const name: string = "Alice";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0027 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0028
     * @tc.name      testUserRepositoryMatrix0028
     * @tc.desc      createUser/UserRepository/UserService keep id 10 and name #28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0028 begin');
      const id: number = 10;
      const name: string = "Bob";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0028 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0029
     * @tc.name      testUserRepositoryMatrix0029
     * @tc.desc      createUser/UserRepository/UserService keep id 10 and name #29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0029 begin');
      const id: number = 10;
      const name: string = "中文";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0029 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0030
     * @tc.name      testUserRepositoryMatrix0030
     * @tc.desc      createUser/UserRepository/UserService keep id 10 and name #30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0030 begin');
      const id: number = 10;
      const name: string = "a b";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0030 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0031
     * @tc.name      testUserRepositoryMatrix0031
     * @tc.desc      createUser/UserRepository/UserService keep id 99 and name #31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0031 begin');
      const id: number = 99;
      const name: string = "";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0031 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0032
     * @tc.name      testUserRepositoryMatrix0032
     * @tc.desc      createUser/UserRepository/UserService keep id 99 and name #32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0032 begin');
      const id: number = 99;
      const name: string = "Alice";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0032 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0033
     * @tc.name      testUserRepositoryMatrix0033
     * @tc.desc      createUser/UserRepository/UserService keep id 99 and name #33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0033 begin');
      const id: number = 99;
      const name: string = "Bob";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0033 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0034
     * @tc.name      testUserRepositoryMatrix0034
     * @tc.desc      createUser/UserRepository/UserService keep id 99 and name #34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0034 begin');
      const id: number = 99;
      const name: string = "中文";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0034 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0035
     * @tc.name      testUserRepositoryMatrix0035
     * @tc.desc      createUser/UserRepository/UserService keep id 99 and name #35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0035 begin');
      const id: number = 99;
      const name: string = "a b";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0035 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0036
     * @tc.name      testUserRepositoryMatrix0036
     * @tc.desc      createUser/UserRepository/UserService keep id 100 and name #36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0036 begin');
      const id: number = 100;
      const name: string = "";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0036 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0037
     * @tc.name      testUserRepositoryMatrix0037
     * @tc.desc      createUser/UserRepository/UserService keep id 100 and name #37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0037 begin');
      const id: number = 100;
      const name: string = "Alice";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0037 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0038
     * @tc.name      testUserRepositoryMatrix0038
     * @tc.desc      createUser/UserRepository/UserService keep id 100 and name #38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0038 begin');
      const id: number = 100;
      const name: string = "Bob";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0038 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0039
     * @tc.name      testUserRepositoryMatrix0039
     * @tc.desc      createUser/UserRepository/UserService keep id 100 and name #39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0039 begin');
      const id: number = 100;
      const name: string = "中文";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0039 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0040
     * @tc.name      testUserRepositoryMatrix0040
     * @tc.desc      createUser/UserRepository/UserService keep id 100 and name #40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0040 begin');
      const id: number = 100;
      const name: string = "a b";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0040 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0041
     * @tc.name      testUserRepositoryMatrix0041
     * @tc.desc      createUser/UserRepository/UserService keep id 1000 and name #41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0041 begin');
      const id: number = 1000;
      const name: string = "";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0041 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0042
     * @tc.name      testUserRepositoryMatrix0042
     * @tc.desc      createUser/UserRepository/UserService keep id 1000 and name #42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0042 begin');
      const id: number = 1000;
      const name: string = "Alice";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0042 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0043
     * @tc.name      testUserRepositoryMatrix0043
     * @tc.desc      createUser/UserRepository/UserService keep id 1000 and name #43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0043 begin');
      const id: number = 1000;
      const name: string = "Bob";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0043 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0044
     * @tc.name      testUserRepositoryMatrix0044
     * @tc.desc      createUser/UserRepository/UserService keep id 1000 and name #44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0044 begin');
      const id: number = 1000;
      const name: string = "中文";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0044 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0045
     * @tc.name      testUserRepositoryMatrix0045
     * @tc.desc      createUser/UserRepository/UserService keep id 1000 and name #45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0045 begin');
      const id: number = 1000;
      const name: string = "a b";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0045 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0046
     * @tc.name      testUserRepositoryMatrix0046
     * @tc.desc      createUser/UserRepository/UserService keep id 2147483647 and name #46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0046 begin');
      const id: number = 2147483647;
      const name: string = "";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0046 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0047
     * @tc.name      testUserRepositoryMatrix0047
     * @tc.desc      createUser/UserRepository/UserService keep id 2147483647 and name #47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0047 begin');
      const id: number = 2147483647;
      const name: string = "Alice";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0047 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0048
     * @tc.name      testUserRepositoryMatrix0048
     * @tc.desc      createUser/UserRepository/UserService keep id 2147483647 and name #48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0048 begin');
      const id: number = 2147483647;
      const name: string = "Bob";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0048 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0049
     * @tc.name      testUserRepositoryMatrix0049
     * @tc.desc      createUser/UserRepository/UserService keep id 2147483647 and name #49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0049 begin');
      const id: number = 2147483647;
      const name: string = "中文";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0049 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERREPO_testUserRepositoryMatrix0050
     * @tc.name      testUserRepositoryMatrix0050
     * @tc.desc      createUser/UserRepository/UserService keep id 2147483647 and name #50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserRepositoryMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0050 begin');
      const id: number = 2147483647;
      const name: string = "a b";
      const user: User = { id: id, name: name };
      expect(user.id).assertEqual(id);
      expect(user.name).assertEqual(name);
      expect(user.name.length).assertEqual(name.length);
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      repo.save(user);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(id);
      expect(repo.list()[0].name).assertEqual(name);
      const listed: User[] = repo.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0] === user).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserRepositoryMatrix0050 end');
    })

  });
}
