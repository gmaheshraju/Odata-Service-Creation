package main;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the currency database table.
 * 
 */
@Entity
@NamedQuery(name="Currency.findAll", query="SELECT c FROM Currency c")
public class Currency implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idCurrency;

	@Column
	private String name;

	//bi-directional many-to-one association to Country
	@OneToMany(mappedBy="currency")
	private List<Country> countries;

	public Currency() {
	}

	public String getIdCurrency() {
		return this.idCurrency;
	}

	public void setIdCurrency(String idCurrency) {
		this.idCurrency = idCurrency;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Country> getCountries() {
		return this.countries;
	}

	public void setCountries(List<Country> countries) {
		this.countries = countries;
	}

	public Country addCountry(Country country) {
		getCountries().add(country);
		country.setCurrency(this);

		return country;
	}

	public Country removeCountry(Country country) {
		getCountries().remove(country);
		country.setCurrency(null);

		return country;
	}

}