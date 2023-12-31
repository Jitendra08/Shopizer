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
package com.salesmanager.core.service.catalog.impl.dao;

import java.util.Collection;

import com.salesmanager.core.entity.catalog.ProductPrice;

public interface IProductPriceDao {

	public void persist(ProductPrice transientInstance);

	public void saveOrUpdate(ProductPrice instance);

	public void delete(ProductPrice persistentInstance);

	public ProductPrice merge(ProductPrice detachedInstance);

	public ProductPrice findById(long id);

	public void deleteAll(Collection<ProductPrice> coll);

	public void saveOrUpdateAll(Collection<ProductPrice> coll);

}