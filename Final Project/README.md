## Study of heat and mass transfer in donuts during the process of deep frying using finite element analysis (FEA).

This repository contains the FEA simulation file (Comsol) to evaluate heat and mass transfer from a donut during the deep frying process. This simulation was inspired by my educational experience at UC Davis.

Authors: Guilherme De Moura Araujo, Kaiyan Li, and Vishal Singh

#### Disclaimer:

While every attempt has been made to accurately present the models and their solutions,  they have not been verified independently and some typographical and/or technical errors may be present due to the type of assumptions made. In any case, the author (Guilherme De Moura Araujo) hopes that these models and solutions will be a helpful guide and assist in making further improvements as necessary.

### Introduction

Donuts are a popular deep-fried food present in various forms all over the world, prepared as a sweet snack or desert and usually accompanied by a cup of coffee and good stories. However, modern diets demand healthier nourishments, specially advertising against deep-fried foods. The donut frying process occurs in such a way that the donut dough loses water to the medium and uptakes oil instead. In the process the oil concentration, temperature and frying time play a key role on how heat and mass transfer occurs from the environment and the donut. A complete understanding of this process could potentially result in a final product with lower oil content, making the so beloved donut healthier. Therefore, this project aims at modeling the donut frying process by means of simplified analytical solution and numerical solutions (finite element analysis).


### Project development:
a) Mass transfer

- Set up governing ODE for the core and the crust regions

Core

![image](https://user-images.githubusercontent.com/39603677/115283876-d0cb7a00-a100-11eb-981e-94ee0b37aa34.png)

Crust

![image](https://user-images.githubusercontent.com/39603677/115283914-e0e35980-a100-11eb-9108-86196ccf8b36.png)


- Set up initial conditions


![image](https://user-images.githubusercontent.com/39603677/115283981-f3f62980-a100-11eb-984d-7340462c5dc9.png)


- Set up boundary conditions

![image](https://user-images.githubusercontent.com/39603677/115284038-03757280-a101-11eb-9daf-382a4fcb6a0e.png)

![image](https://user-images.githubusercontent.com/39603677/115284054-083a2680-a101-11eb-9f05-ea2cc6adfddd.png)

b) Heat transfer

- Set up governing ODE for the core and the crust regions

Core

![image](https://user-images.githubusercontent.com/39603677/115284738-e9885f80-a101-11eb-9618-852c84d9393b.png)

Crust

![image](https://user-images.githubusercontent.com/39603677/115284759-f311c780-a101-11eb-8c19-e0ff6feb7cc0.png)

- Set up initial conditions

![image](https://user-images.githubusercontent.com/39603677/115284814-02911080-a102-11eb-8a4c-f0eaa1d27d81.png)

- Set up boundary conditions

![image](https://user-images.githubusercontent.com/39603677/115284880-1177c300-a102-11eb-8d0d-75da218d84cd.png)

![image](https://user-images.githubusercontent.com/39603677/115284895-18063a80-a102-11eb-946e-08797ef2de51.png)

![image](https://user-images.githubusercontent.com/39603677/115284223-40da0000-a101-11eb-97c4-6c9a55e06c27.png)

![Picture1](https://user-images.githubusercontent.com/39603677/115284175-33247a80-a101-11eb-9daf-03c5a4112862.png)

c) Assumptions

- System parameters

![considerations](https://user-images.githubusercontent.com/39603677/115285400-af6b8d80-a102-11eb-8ee1-eb8929818171.JPG)

- System geometry

![considerations](https://user-images.githubusercontent.com/39603677/115285651-f8234680-a102-11eb-8e10-a4e0661d5e97.JPG)


d) Material Properties and Time Dependency

![image](https://user-images.githubusercontent.com/39603677/115285802-29037b80-a103-11eb-8ee1-6f1a1c30bdf8.png)

### Results
![image](https://user-images.githubusercontent.com/39603677/115285843-39b3f180-a103-11eb-9a79-6f22ce93cfff.png)
(a)

![image](https://user-images.githubusercontent.com/39603677/115285864-3f113c00-a103-11eb-9d69-dc7a0fcd0d1e.png)

(b)

Fig. 1 - Oil concentration at t=0s. (a) Profile view, and (b) Perspective view

![image](https://user-images.githubusercontent.com/39603677/115285884-446e8680-a103-11eb-9062-d8ff57abceeb.png)

(a)

![image](https://user-images.githubusercontent.com/39603677/115285900-4afcfe00-a103-11eb-98af-892f53f05cd3.png)

(b)

Fig. 2 - Surface temperature at t=0s. (a) Profile view, and (b) Perspective view

### References
Alvis, A., Velez, C., Mendoza, M. R., Villamiel, M., Villada, H. S. Heat transfer coefficient during deep-fat frying. Food Control, v. 20, p. 321-325, 2009.

Ateba, P. and Mittal, G.S., Modeling the deep-fat frying of beef meatballs, Intl. J. Food Sci. Technol., 29, 429–440, 1994.

Bouchon, P., Aguilera, J.M., Pyle, D.L., 2003. Structure oil-absorption relationships during deep-fat frying. J. Food Sci. 68, 2711-2716.

Farkas, B. E., Singh, R. P. & Rumsey, T. (1995). Mathematical modeling of immersion frying: A novel use of drying theory. Proceedings of the 9th International Drying Symposium, Gold Coast, Australia, August l-4, 1994.

Farkas, B. E., Singh, R. P., Rumsey, T. R. Modeling Heat and Mass Transfer in Immersion Frying. I, Model Development. Journal of Food Engineering, v. 29, p. 211-226, 1996.
fat frying and its effect on fry quality distribution and mobility. J. Food Sci. Technol. http://dx.doi.org/10.1007/s13197-015-2070-2.

K.N. van Koerten, D. Somsen, R.M. Boom, M.A.I. Schutyser, Modelling water evaporation during frying with an evaporation dependent heat transfer coefficient, J. Food Eng. (2017). doi:10.1016/j.jfoodeng.2016.11.007.

Lamhcrg. I., Hallstrom, B. Kr Olsson, H. (1990). Fat uptake in a potato drying/frying process. Lihettsm. Wiss. U. Echtwl. , 23 (4).

Maache-Rezzoug, Z., Bouvier, J.M., Allaf, K., and Patras, C., Effect of principal ingredients
on rheological behaviour of biscuit dough and on quality of biscuits, J. Food Eng., 35, 23–42, 1998.

Rice, P. and Gamble, M.H., Technical note: modelling moisture loss during potato slice frying, Int. J. Food Sci. Technol., 24, 183–187, 1989.

Sandhu, J., Bansal, H., Takhar, P.S., 2013. Experimental measurement of physical pressure in foods during frying. J. Food Eng. 115, 272-277.

Van Koerten, K.N., Schutyser, M.A.I., Somsen, D., Boom, R.M., 2015c. Cross-flow deep
Vélez, R. J. F., & Sosa-Morales, S. M. E. (2003). Heat and mass transfer during the frying process of donuts. CRC Press LLC.

Vitrac, O., Trystram, G., Raoult-Wack, A.-L., 2000. Deep-fat frying of food: heat and mass transfer, transformations and reactions inside the frying material. Eur. J. Lipid Sci. Technol. 102, 529-538.

Ziaiifar, A.M., Achir, N., Courtois, F., Trezzani, I., Trystram, G., 2008. Review of mechanisms, conditions, and factors involved in the oil uptake phenomenon during the deep-fat frying process. Int. J. Food Sci. Technol. 43, 1410-1423.
