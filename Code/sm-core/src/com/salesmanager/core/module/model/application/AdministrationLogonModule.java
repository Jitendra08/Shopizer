/*
 * Licensed to csti consulting 
 * You may obtain a copy of the License at
 *
 * http://www.csticonsulting.com
 * Copyright (c) 2006-Aug 24, 2010 Consultation CS-TI inc. 
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package com.salesmanager.core.module.model.application;

import javax.servlet.http.HttpServletRequest;

import com.salesmanager.core.entity.merchant.MerchantUserInformation;
import com.salesmanager.core.service.ServiceException;

public interface AdministrationLogonModule extends LogonModule {

	public MerchantUserInformation logon(HttpServletRequest request)
			throws ServiceException;

	public String getUser(HttpServletRequest request) throws ServiceException;

}
