
###################### CLASE USUARIO ##########################################################

class Usuario
    #(nombre_usuario, saldo_total)

   attr_accessor :saldo_total
   attr_reader :nombre_usuario, :cta_bancaria, :total_u
   def initialize(nombre_usuario, cta_bancaria, saldo_total) 
   
    @nombre_usuario = nombre_usuario
    @saldo_total = saldo_total
    @cta_bancaria = cta_bancaria
   end

   def saldo_total()
    @total_u = @saldo_total - @saldo 
   end
   
end

###################### CLASE CUENTA BANCARIA ##########################################################

class CuentaBancaria
    
    attr_accessor :saldo 

    def initialize(nombre_banco, numero_cta, saldo=0)
        raise RangeError, 'numero de cuenta incorrecto!! debe contener 8 digitos!!' if numero_de_cuenta.digits.count != 8 

        @nombre_banco = nombre_banco
        @numero_cta = numero_cta
        @saldo = saldo
                
    end


    def transferir(monto, cta_destino)
    
    @monto = monto
    
    total = @saldo - @monto
    @cta_destino = cta_destino 
    end
end


##################### MENU ########################
def menu()

print "\n"
puts "************ BIENVENIDO A LA PLATAFORMA DE TRANSACCIONES DEL BANCO DEL MUNDO MUNDIAL ************"
print "\n"
puts "Digite una opcion del 1 al 4"
print "\n"
puts "1.Ingresar como nuevo cliente"
puts "2.Transferir dinero entre usuarios"
puts "3.Consultar mi saldo"
puts "4.Salir"
print "\n"

opcion_m=gets.chomp.to_i

 while opcion_m != 1 && opcion_m != 2 && opcion_m != 3 && opcion_m != 4
    puts "opcion incorrecta, digite 1, 2 ó 3"
    print "\n"
    puts "************ BIENVENIDO A LA PLATAFORMA DE TRANSACCIONES DEL BANCO DEL MUNDO MUNDIAL ************"
    print "\n"
    puts "Digite una opcion del 1 al 3"
    print "\n"
    puts "1.Ingresar como nuevo cliente"
    puts "2.Transferir dinero entre usuarios"
    puts "3.Consultar mi saldo"
    puts "4.Salir"
    print "\n" 
   #@cta_bancaria, @nombre_usuario, @saldo_total
  #print opcion_m 
  opcion_m=gets.chomp.to_i
 end
  opcion_m
end
################## INGRESANDO DATOS DE CLASE "USUARIO" ################################################
def usuario_nuevo(numero_cuenta_usuario) 
print "\n"
print "ingrese nombre de usuario"
print "\n"
nombre_u = gets

print "\n"
print "ingrese su saldo"
print "\n"
u_saldo = gets.chomp.to_i


n_usuario = Usuario.new(nombre_u, numero_cuenta_usuario, u_saldo)
arreglo_ex=[@cta_bancaria, @nombre_usuario, n_usuario.saldo_total]
#######??????
arreglo_usuario=[]
arreglo_usuario << Array.new(arreglo_ex)
end

################## INGRESANDO DATOS DE CLASE "CUENTA BANCARIA" #################################################
def datos_cta_bancaria()

print "\n" 
print "ingrese nombre del banco"
print "\n"
a = gets

print "\n"
print "ingrese numero de cuenta de 8 digitos"
print "\n"
b=gets.chomp.to_i

print "\n" 
print "ingrese saldo"
print "\n"
c = gets.chomp.to_i


cuenta = CuentaBancaria.new(a, b, c)

end

#################### TRANSFIRIENDO ########################################3

def transferir_otra_cta(arreglo_usuario)

  print "\n"
  print "ingrese el monto a transferir"   
  d=gets.chomp.to_i  
  print "\n"
  print "ingrese la cuenta de destino"
  e=gets.chomp.to_i
  print "\n"

  if arreglo_usuario.select {|item| e == item} 
      #print item
  transferir_cta = CuentaBancaria.transferir(d, e)
  
  end
#### 
  print "\n"
 
end


def consultar_saldo()
   
    print "su saldo es: "
end    

############ INICIO ##############
def iniciar()
opcion = menu()


arreglo_usuario=[]

if opcion == 1
   
   ingresar = 's'
   numero_cuenta_usuario=10000000 

   while ingresar =='S' || ingresar == 's'
   arreglo_usuario << Array.new(usuario_nuevo(numero_cuenta_usuario))
   print "desea ingresar otro usuario? S/N"
   ingresar=gets 
   numero_cuenta_usuario += 1
   print arreglo_usuario
   end

 elsif opcion == 2
      transferir_otra_cta(arreglo_usuario)

 elsif opcion == 3
    consultar_saldo() 

 elsif opcion == 4
    #print opcion
    
    return   
 end
 iniciar()
end

iniciar()

#print arreglo_usuario
#end