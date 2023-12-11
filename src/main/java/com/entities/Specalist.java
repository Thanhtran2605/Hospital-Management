package com.entities;

public class Specalist {
	private int id;
	private String specalistName;

	public Specalist(int id, String specalistName) {
		super();
		this.id = id;
		this.specalistName = specalistName;
	}

	public Specalist() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecalistName() {
		return specalistName;
	}

	public void setSpecialistName(String specalistName) {
		this.specalistName = specalistName;
	}

	@Override
	public String toString() {
		return "Specalist [id=" + id + ", specalistName=" + specalistName + "]";
	}

}
