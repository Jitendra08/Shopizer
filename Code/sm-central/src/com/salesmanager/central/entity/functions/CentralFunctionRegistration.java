/*
 * Provided by CSTI Consulting 
 * Following GNU LESSER GENERAL PUBLIC LICENSE
 * You may obtain more details at
 *
 * http://www.csticonsulting.com
 * Copyright (c) 2006-2010 Consultation CS-TI inc. 
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package com.salesmanager.central.entity.functions;

// Generated Aug 14, 2007 12:31:52 PM by Hibernate Tools 3.2.0.b9

import java.util.Date;

/**
 * CentralFunctionRegistrationId generated by hbm2java
 */
public class CentralFunctionRegistration implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7540825198954918979L;
	private int centralRegistrationAssociationId;
	private String centralFunctionCode;
	private String centralFunctionUrl;
	private boolean centralFunctionVisible;
	private byte centralFunctionPosition;
	private String centralFunctionDescription;
	private String centralGroupCode;
	private int merchantRegistrationDefCode;
	private int promotionCode;
	private boolean centralFunctionNew;
	private Date centralFunctionNewUntil;

	public CentralFunctionRegistration() {
	}

	public CentralFunctionRegistration(int centralRegistrationAssociationId,
			String centralFunctionCode, boolean centralFunctionVisible,
			byte centralFunctionPosition, String centralGroupCode,
			int merchantRegistrationDefCode, int promotionCode,
			boolean centralFunctionNew) {
		this.centralRegistrationAssociationId = centralRegistrationAssociationId;
		this.centralFunctionCode = centralFunctionCode;
		this.centralFunctionVisible = centralFunctionVisible;
		this.centralFunctionPosition = centralFunctionPosition;
		this.centralGroupCode = centralGroupCode;
		this.merchantRegistrationDefCode = merchantRegistrationDefCode;
		this.promotionCode = promotionCode;
		this.centralFunctionNew = centralFunctionNew;
	}

	public CentralFunctionRegistration(int centralRegistrationAssociationId,
			String centralFunctionCode, String centralFunctionUrl,
			boolean centralFunctionVisible, byte centralFunctionPosition,
			String centralFunctionDescription, String centralGroupCode,
			int merchantRegistrationDefCode, int promotionCode,
			boolean centralFunctionNew, Date centralFunctionNewUntil) {
		this.centralRegistrationAssociationId = centralRegistrationAssociationId;
		this.centralFunctionCode = centralFunctionCode;
		this.centralFunctionUrl = centralFunctionUrl;
		this.centralFunctionVisible = centralFunctionVisible;
		this.centralFunctionPosition = centralFunctionPosition;
		this.centralFunctionDescription = centralFunctionDescription;
		this.centralGroupCode = centralGroupCode;
		this.merchantRegistrationDefCode = merchantRegistrationDefCode;
		this.promotionCode = promotionCode;
		this.centralFunctionNew = centralFunctionNew;
		this.centralFunctionNewUntil = centralFunctionNewUntil;
	}

	public int getCentralRegistrationAssociationId() {
		return this.centralRegistrationAssociationId;
	}

	public void setCentralRegistrationAssociationId(
			int centralRegistrationAssociationId) {
		this.centralRegistrationAssociationId = centralRegistrationAssociationId;
	}

	public String getCentralFunctionCode() {
		return this.centralFunctionCode;
	}

	public void setCentralFunctionCode(String centralFunctionCode) {
		this.centralFunctionCode = centralFunctionCode;
	}

	public String getCentralFunctionUrl() {
		return this.centralFunctionUrl;
	}

	public void setCentralFunctionUrl(String centralFunctionUrl) {
		this.centralFunctionUrl = centralFunctionUrl;
	}

	public boolean isCentralFunctionVisible() {
		return this.centralFunctionVisible;
	}

	public void setCentralFunctionVisible(boolean centralFunctionVisible) {
		this.centralFunctionVisible = centralFunctionVisible;
	}

	public byte getCentralFunctionPosition() {
		return this.centralFunctionPosition;
	}

	public void setCentralFunctionPosition(byte centralFunctionPosition) {
		this.centralFunctionPosition = centralFunctionPosition;
	}

	public String getCentralFunctionDescription() {
		return this.centralFunctionDescription;
	}

	public void setCentralFunctionDescription(String centralFunctionDescription) {
		this.centralFunctionDescription = centralFunctionDescription;
	}

	public String getCentralGroupCode() {
		return this.centralGroupCode;
	}

	public void setCentralGroupCode(String centralGroupCode) {
		this.centralGroupCode = centralGroupCode;
	}

	public int getMerchantRegistrationDefCode() {
		return this.merchantRegistrationDefCode;
	}

	public void setMerchantRegistrationDefCode(int merchantRegistrationDefCode) {
		this.merchantRegistrationDefCode = merchantRegistrationDefCode;
	}

	public int getPromotionCode() {
		return this.promotionCode;
	}

	public void setPromotionCode(int promotionCode) {
		this.promotionCode = promotionCode;
	}

	public boolean isCentralFunctionNew() {
		return this.centralFunctionNew;
	}

	public void setCentralFunctionNew(boolean centralFunctionNew) {
		this.centralFunctionNew = centralFunctionNew;
	}

	public Date getCentralFunctionNewUntil() {
		return this.centralFunctionNewUntil;
	}

	public void setCentralFunctionNewUntil(Date centralFunctionNewUntil) {
		this.centralFunctionNewUntil = centralFunctionNewUntil;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CentralFunctionRegistration))
			return false;
		CentralFunctionRegistration castOther = (CentralFunctionRegistration) other;

		return (this.getCentralRegistrationAssociationId() == castOther
				.getCentralRegistrationAssociationId())
				&& ((this.getCentralFunctionCode() == castOther
						.getCentralFunctionCode()) || (this
						.getCentralFunctionCode() != null
						&& castOther.getCentralFunctionCode() != null && this
						.getCentralFunctionCode().equals(
								castOther.getCentralFunctionCode())))
				&& ((this.getCentralFunctionUrl() == castOther
						.getCentralFunctionUrl()) || (this
						.getCentralFunctionUrl() != null
						&& castOther.getCentralFunctionUrl() != null && this
						.getCentralFunctionUrl().equals(
								castOther.getCentralFunctionUrl())))
				&& (this.isCentralFunctionVisible() == castOther
						.isCentralFunctionVisible())
				&& (this.getCentralFunctionPosition() == castOther
						.getCentralFunctionPosition())
				&& ((this.getCentralFunctionDescription() == castOther
						.getCentralFunctionDescription()) || (this
						.getCentralFunctionDescription() != null
						&& castOther.getCentralFunctionDescription() != null && this
						.getCentralFunctionDescription().equals(
								castOther.getCentralFunctionDescription())))
				&& ((this.getCentralGroupCode() == castOther
						.getCentralGroupCode()) || (this.getCentralGroupCode() != null
						&& castOther.getCentralGroupCode() != null && this
						.getCentralGroupCode().equals(
								castOther.getCentralGroupCode())))
				&& (this.getMerchantRegistrationDefCode() == castOther
						.getMerchantRegistrationDefCode())
				&& (this.getPromotionCode() == castOther.getPromotionCode())
				&& (this.isCentralFunctionNew() == castOther
						.isCentralFunctionNew())
				&& ((this.getCentralFunctionNewUntil() == castOther
						.getCentralFunctionNewUntil()) || (this
						.getCentralFunctionNewUntil() != null
						&& castOther.getCentralFunctionNewUntil() != null && this
						.getCentralFunctionNewUntil().equals(
								castOther.getCentralFunctionNewUntil())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getCentralRegistrationAssociationId();
		result = 37
				* result
				+ (getCentralFunctionCode() == null ? 0 : this
						.getCentralFunctionCode().hashCode());
		result = 37
				* result
				+ (getCentralFunctionUrl() == null ? 0 : this
						.getCentralFunctionUrl().hashCode());
		result = 37 * result + (this.isCentralFunctionVisible() ? 1 : 0);
		result = 37 * result + this.getCentralFunctionPosition();
		result = 37
				* result
				+ (getCentralFunctionDescription() == null ? 0 : this
						.getCentralFunctionDescription().hashCode());
		result = 37
				* result
				+ (getCentralGroupCode() == null ? 0 : this
						.getCentralGroupCode().hashCode());
		result = 37 * result + this.getMerchantRegistrationDefCode();
		result = 37 * result + this.getPromotionCode();
		result = 37 * result + (this.isCentralFunctionNew() ? 1 : 0);
		result = 37
				* result
				+ (getCentralFunctionNewUntil() == null ? 0 : this
						.getCentralFunctionNewUntil().hashCode());
		return result;
	}

}
